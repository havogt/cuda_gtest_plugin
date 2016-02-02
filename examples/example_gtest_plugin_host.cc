/**
 * Test demonstrates that a warning is produced in compilation if it is compiled with a host compiler.
 * The test runs on device
 */

#ifndef TEST_EXAMPLE_GTEST_PLUGIN_HOST_CU_
#define TEST_EXAMPLE_GTEST_PLUGIN_HOST_CU_

#include "../include/cuda_gtest_plugin.h"

CUDA_TEST( ATest, WithFloat_IfNotCompiledWithCuda_ShouldGiveWarningOnCompile_ButStillRunOnHost )
{
	float expect = 1.23;
	float someVariable = 1.23;

	ASSERT_EQ(expect,someVariable);
}

#endif /* TEST_EXAMPLE_CU_ */
