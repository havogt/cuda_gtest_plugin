# cuda_gtest_plugin

Hacks into googletest to provide the possibility to test small code fragments in CUDA kernels (and in host code).

### When do you need it?

Suppose you want to test a class that uses different code on host and device. With this plugin you need to write only a single test. In the test summary two tests will appear, the one with suffix "_CUDA" is run in a kernel.

### How does it work

Googletest uses preprocessor macros for defining `TEST`s. We define a new macro `CUDA_TEST`. The body of the test is duplicated into original `TEST`s and, the one for CUDA, is surrounded with CUDA code. The `ASSERT`s are manipulated as well, to work in CUDA kernels. The result of a `CUDA_ASSERT` is copied back to host and evaluated there with the original `ASSERT`.

### Limitations
* Only `ASSERT_EQ` and `ASSERT_FLOAT_EQ` is supported.
* The number of `ASSERT`s in one test is limited to 10 for each type.

