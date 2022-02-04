const int global = 0;

void test() __attribute__((optnone)) {
  *(int*)&global = 3;
}
