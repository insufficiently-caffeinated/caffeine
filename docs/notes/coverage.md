# Notes on coverage

In order to get a coverage report of our tests, we can use
[clang's coverage tools](https://clang.llvm.org/docs/SourceBasedCodeCoverage.html).

To start, delete your `build` directory and recreate it, then
run the following command to set up coverage.

```
CC=clang CXX=clang++ cmake -DCMAKE_BUILD_TYPE=Debug -DCAFFEINE_ENABLE_COVERAGE=ON ..
```

This ensures we're using clang and all files are compiled with
coverage support. Then, running any executable or test will
create a `default.profraw` file which can be used for coverage
analysis. In order to aggregate all the files run the following
command in the build folder:

```
llvm-profdata-11 merge -sparse `find . -name "*.profraw"` -o default.profdata
```
Finally, to generate HTML files or reports you can run
```
llvm-cov-11 report -instr-profile ./default.profdata bin/caffeine-unittest -format=html > coverage.html
```
or for a summary:
```
llvm-cov-11 report -instr-profile ./default.profdata bin/caffeine-unittest -format=text > coverage.txt
```
