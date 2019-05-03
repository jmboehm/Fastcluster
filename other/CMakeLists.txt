
cmake_minimum_required(VERSION 3.0)
project (fastcluster LANGUAGES C)
include_directories(src) # This location "src" is added to the list of locations 
                         # which are searched when resolving #include statements in C/C++
include_directories(src/fastcluster)

# set WITH_EXTERNAL to ON for automatic download and build
# of external libraries googletest and interp2d
option(WITH_EXTERNAL "download and build external projects" OFF)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_modules)

# set some variables
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -DBZ_DEBUG")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -DNDEBUG -DARMA_NO_DEBUG")
#set(CMAKE_SHARED_LIBRARY_SUFFIX ".so")

message("Cmake build type is ${CMAKE_BUILD_TYPE}")

message("Compiler is ${CMAKE_CXX_COMPILER_ID}")



# add GSL
#find_package(GSL REQUIRED)
# unnecessary
#include_directories(${GSL_INCLUDE_DIRS} ${GSLCBLAS_INCLUDE_DIRS})

# add blitz
#find_package(blitz++)


# add armadillo includes
#include_directories(/usr/local/include)


# add my cpp source files
#add_subdirectory(src) 
add_library(fastcluster SHARED src/fastcluster.cpp) 

# link executables
# all libraries (except gtest)
#set(LIBS ${GSL_LIBRARIES} ${GSLCBLAS_LIBRARIES} armadillo interp2d bankruptcy_library ${BLITZ++_LIBRARY})
set(LIBS stdc++)

target_link_libraries(fastcluster ${LIBS} ) # Add all libraries to the executable
set_target_properties(fastcluster PROPERTIES LINKER_LANGUAGE C)
				
install(TARGETS fastcluster
    LIBRARY DESTINATION ${PROJECT_SOURCE_DIR}/lib)			

enable_testing()


