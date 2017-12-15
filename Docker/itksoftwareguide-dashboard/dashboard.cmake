#############################
# Maintainer: Matt McCormick
# m a t t . m c c o r m i c k
# @ k i t w a r e . c o m
#
# See https://github.com/InsightSoftwareConsortium/ITKDevelopmentEnvironment
#############################

# Build identification.
set(CTEST_SITE "$ENV{HOSTNAME}.docker")
if("$ENV{CIRCLE_PROJECT_REPONAME}")
  set(sha "$ENV{CIRCLE_SHA1}")
  string(SUBSTRING "${sha}" 0 7 short_sha)
  set(CTEST_BUILD_NAME "Software Guide CircleCI build $ENV{CIRCLE_BUILD_NUM} for ${short_sha}")
else()
  set(CTEST_BUILD_NAME "Linux GCC Software Guide")
endif()
set(CTEST_BUILD_CONFIGURATION MinSizeRel)
set(CTEST_CMAKE_GENERATOR "Ninja")

set(CTEST_DASHBOARD_ROOT "/")
set(CTEST_SOURCE_DIRECTORY ${CTEST_DASHBOARD_ROOT}ITKSoftwareGuide)
set(CTEST_BINARY_DIRECTORY ${CTEST_DASHBOARD_ROOT}ITKSoftwareGuide-build)
set(CTEST_CONFIGURATION_TYPE ${CTEST_BUILD_CONFIGURATION})

find_program(CTEST_GIT_COMMAND NAMES git git.cmd)
if(NOT DEFINED CTEST_GIT_COMMAND)
  message(FATAL_ERROR "No Git Found.")
endif()

# Upload information
set(CTEST_NIGHTLY_START_TIME "01:00:00 UTC")
set(CTEST_DROP_METHOD "http")
set(CTEST_DROP_SITE "open.cdash.org")
set(CTEST_DROP_LOCATION "/submit.php?project=Insight")
set(CTEST_DROP_SITE_CDASH TRUE)
list(APPEND CTEST_NOTES_FILES "${CTEST_SCRIPT_DIRECTORY}/${CTEST_SCRIPT_NAME}")

# Start with a fresh build tree.
ctest_empty_binary_directory(${CTEST_BINARY_DIRECTORY}/)

# Initial cache.
file(WRITE ${CTEST_BINARY_DIRECTORY}/CMakeCache.txt "
SITE:STRING=${CTEST_SITE}
BUILDNAME:STRING=${CTEST_BUILD_NAME}
ITK_GIT_TAG:STRING=nightly-master
CMAKE_JOB_POOLS:STRING=compile=10;link=2
CMAKE_JOB_POOL_COMPILE:STRING=compile
CMAKE_JOB_POOL_LINK:STRING=link
")

if("$ENV{CIRCLE_PROJECT_REPONAME}")
  ctest_start(Experimental)
else()
  ctest_start(Nightly)
endif()
ctest_update()
ctest_configure(BUILD "${CTEST_BINARY_DIRECTORY}" SOURCE "${CTEST_SOURCE_DIRECTORY}")
ctest_submit(PARTS Update Notes Configure)

ctest_build(BUILD "${CTEST_BINARY_DIRECTORY}" APPEND)
ctest_test(BUILD "${CTEST_BINARY_DIRECTORY}")
ctest_submit(PARTS Build Test)

file(GLOB pdfs "${CTEST_BINARY_DIRECTORY}/ITKSoftwareGuide-build/SoftwareGuide/Latex/*.pdf")
ctest_upload(FILES ${pdfs})
ctest_submit(PARTS Upload)
