#include "caffeine/Support/LMDB.h"
#include "caffeine/Support/Assert.h"
#include <cstdlib>
#include <exception>
#include <string>
#include <string_view>

namespace caffeine::lmdb {

MDBException::MDBException(int err) : error(err) {}

const char* MDBException::what() const noexcept {
  return mdb_strerror(error);
}

env::env(MDB_env* env) : env_(env) {}
env::env(const char* path, unsigned int flags, mdb_mode_t mode) {
  if (int error = mdb_env_create(&env_))
    throw MDBException(error);

  if (int error = mdb_env_set_maxdbs(env_, 1))
    throw MDBException(error);

  if (int error = mdb_env_set_mapsize(env_, (size_t)1 * 1024 * 1024 * 1024))
    throw MDBException(error);

  if (int error = mdb_env_open(env_, path, flags, mode))
    throw MDBException(error);
}
env::~env() {
  if (env_)
    mdb_env_close(env_);
}

env::env(env&& e) : env_(e.env_) {
  e.env_ = nullptr;
}
env& env::operator=(env&& e) {
  if (env_)
    mdb_env_close(env_);
  env_ = e.env_;
  e.env_ = nullptr;
  return *this;
}

env::operator MDB_env*() const {
  return env_;
}

MDB_dbi env::open_db(const char* name, unsigned flags) {
  MDB_txn* txn;
  if (int error = mdb_txn_begin(*this, nullptr, 0, &txn))
    throw MDBException(error);

  MDB_dbi dbi = 0;
  if (int error = mdb_dbi_open(txn, name, flags, &dbi)) {
    mdb_txn_abort(txn);
    throw MDBException(error);
  }

  if (int error = mdb_txn_commit(txn)) {
    mdb_txn_abort(txn);
    throw MDBException(error);
  }

  return dbi;
}

txn env::begin_txn(MDB_dbi dbi, unsigned flags) {
  MDB_txn* mtxn;
  if (int error = mdb_txn_begin(*this, nullptr, flags, &mtxn))
    throw MDBException(error);

  return txn(mtxn, dbi);
}

txn::txn(MDB_txn* txn, MDB_dbi dbi) : txn_(txn), dbi_(dbi) {}
txn::~txn() {
  abort();
}

txn::txn(txn&& t) : txn_(t.txn_), dbi_(t.dbi_) {
  t.txn_ = nullptr;
}
txn& txn::operator=(txn&& t) {
  abort();

  txn_ = t.txn_;
  dbi_ = t.dbi_;
  t.txn_ = nullptr;

  return *this;
}

txn::operator MDB_txn*() const {
  return txn_;
}

std::optional<std::string_view> txn::get(std::string_view key) {
  MDB_val mkey, mval{0, 0};

  mkey.mv_data = (void*)key.data();
  mkey.mv_size = key.size();

  if (int error = mdb_get(*this, dbi_, &mkey, &mval)) {
    if (error == MDB_NOTFOUND)
      return std::nullopt;

    throw MDBException(error);
  }

  return std::string_view((const char*)mval.mv_data, mval.mv_size);
}
void txn::put(std::string_view key, std::string_view val, unsigned flags) {
  MDB_val mkey, mval;

  mkey.mv_data = (void*)key.data();
  mkey.mv_size = key.size();
  mval.mv_data = (void*)val.data();
  mval.mv_size = val.size();

  if (int error = mdb_put(*this, dbi_, &mkey, &mval, flags))
    throw MDBException(error);
}

void txn::commit() {
  CAFFEINE_ASSERT(txn_);

  if (int error = mdb_txn_commit(txn_))
    throw MDBException(error);
  txn_ = nullptr;
}
void txn::abort() {
  if (!txn_)
    return;

  mdb_txn_abort(txn_);
  txn_ = nullptr;
}

} // namespace caffeine::lmdb
