const char data[] = "abcdef";

__attribute__((noinline)) void write_to_data(char* mem) {
  *mem = 'u';
}

void test() {
  write_to_data((char*)data);
}
