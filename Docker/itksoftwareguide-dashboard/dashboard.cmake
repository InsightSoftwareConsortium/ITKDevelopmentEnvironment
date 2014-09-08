#############################
# Maintainer: Matt McCormick
# m a t t . m c c o r m i c k
# @ k i t w a r e . c o m
#############################

# Build identification.
set( CTEST_SITE "$ENV{HOSTNAME}.docker" )
set( CTEST_BUILD_NAME "Linux GCC Software Guide" )
set( CTEST_BUILD_CONFIGURATION MinSizeRel )
set( CTEST_CMAKE_GENERATOR "Unix Makefiles" )

set( CTEST_DASHBOARD_ROOT "/home/itk" )
set( CTEST_SOURCE_DIRECTORY ${CTEST_DASHBOARD_ROOT}/src/ITKSoftwareGuide )
set( CTEST_BINARY_DIRECTORY ${CTEST_DASHBOARD_ROOT}/bin/ITKSoftwareGuide )
set( CTEST_CONFIGURATION_TYPE ${CTEST_BUILD_CONFIGURATION} )

find_program(CTEST_GIT_COMMAND NAMES git git.cmd)
if(NOT DEFINED CTEST_GIT_COMMAND)
  message(FATAL_ERROR "No Git Found.")
endif()

# Upload information
set( CTEST_NIGHTLY_START_TIME "01:00:00 UTC" )
set( CTEST_DROP_METHOD "http" )
set( CTEST_DROP_SITE "open.cdash.org" )
set( CTEST_DROP_LOCATION "/submit.php?project=Insight" )
set( CTEST_DROP_SITE_CDASH TRUE )
list( APPEND CTEST_NOTES_FILES "${CTEST_SCRIPT_DIRECTORY}/${CTEST_SCRIPT_NAME}" )

# Start with a fresh build tree.
ctest_empty_binary_directory( ${CTEST_BINARY_DIRECTORY}/ )

# Initial cache.
file( WRITE ${CTEST_BINARY_DIRECTORY}/CMakeCache.txt "
SITE:STRING=${CTEST_SITE}
BUILDNAME:STRING=${CTEST_BUILD_NAME}
ITKSoftwareGuide_SUPERBUILD:BOOL=OFF
ITK_SOURCE_DIR:PATH=/home/itk/src/ITK
ITK_BINARY_DIR:PATH=/home/itk/bin/ITK
ITK_DIR:PATH=/home/itk/bin/ITK
ITK_EXECUTABLES_DIR:PATH=/home/itk/bin/ITK/bin
" )

ctest_start( Nightly )
ctest_update()
ctest_configure( BUILD "${CTEST_BINARY_DIRECTORY}" SOURCE "${CTEST_SOURCE_DIRECTORY}" )
ctest_submit( PARTS Update Notes Configure )

ctest_build( BUILD "${CTEST_BINARY_DIRECTORY}" APPEND )
ctest_test( BUILD "${CTEST_BINARY_DIRECTORY}" )
ctest_submit( PARTS Build Test )

file( GLOB pdfs "${CTEST_BINARY_DIRECTORY}/SoftwareGuide/Latex/*.pdf" )
ctest_upload( FILES ${pdfs} )
ctest_submit( PARTS Upload )
