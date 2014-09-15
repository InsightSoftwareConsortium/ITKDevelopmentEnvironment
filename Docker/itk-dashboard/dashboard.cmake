#############################
# Maintainer: Matt McCormick
# m a t t . m c c o r m i c k
# @ k i t w a r e . c o m
#
# See https://github.com/InsightSoftwareConsortium/ITKDevelopmentEnvironment
#############################

set(CTEST_SITE "$ENV{HOSTNAME}.docker")
set(dashboard_model Nightly)
set(CTEST_DASHBOARD_ROOT "/home/itk/")
set(CTEST_BUILD_NAME "Debian-GCC-MinSizeRel")
set(CTEST_BUILD_CONFIGURATION MinSizeRel)
set(CTEST_CMAKE_GENERATOR "Unix Makefiles")
set(CTEST_SOURCE_DIRECTORY "${CTEST_DASHBOARD_ROOT}/src/ITK")
set(CTEST_BINARY_DIRECTORY "${CTEST_DASHBOARD_ROOT}/bin/ITK")
include(ProcessorCount)
ProcessorCount(PROCESSOR_COUNT)
if(PROCESSOR_COUNT)
  set(CTEST_BUILD_FLAGS -j${PROCESSOR_COUNT})
endif()
set(CTEST_TEST_ARGS PARALLEL_LEVEL 2)
set(dashboard_cache "
ExternalData_OBJECT_STORES:PATH=/home/itk/data/
")
include(${CTEST_SCRIPT_DIRECTORY}/itk_common.cmake)
