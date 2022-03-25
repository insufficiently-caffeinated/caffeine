#pragma once

#include "lmdb.h"
#include <exception>
#include <memory>
#include <optional>

namespace caffeine::lmdb {

class env;
class txn;

class MDBException : public std::exception {
public:
  MDBException(int err);

  const char* what() const noexcept override;
  int code() const noexcept {
    return error;
  }

private:
  int error;
};

class env {
public:
  env(MDB_env* env);
  env(const char* path, unsigned int flags = 0, mdb_mode_t mode = 0644);
  ~env();

  env(const env&) = delete;
  env& operator=(const env&) = delete;
  env(env&&);
  env& operator=(env&&);

  operator MDB_env*() const;

  MDB_dbi open_db(const char* name, unsigned flags);

  txn begin_txn(MDB_dbi dbi, unsigned flags = 0);

private:
  MDB_env* env_ = nullptr;
};

class txn {
public:
  txn(MDB_txn* txn, MDB_dbi dbi);
  ~txn();

  txn(txn&& t);
  txn& operator=(txn&& t);

  txn(const txn&) = delete;
  txn& operator=(const txn&) = delete;

  operator MDB_txn*() const;

  // Note: The string_view here is only valid until the end of the
  //       transaction.
  std::optional<std::string_view> get(std::string_view key);
  void put(std::string_view key, std::string_view val, unsigned flags = 0);

  void commit();
  void abort();

private:
  MDB_txn* txn_;
  MDB_dbi dbi_;
};

} // namespace caffeine::lmdb
