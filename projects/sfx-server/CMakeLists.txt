cmake_minimum_required(VERSION 3.18)
project(sfx-server)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_VERBOSE_MAKEFILE on)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(PkgConfig REQUIRED)

find_package(Boost COMPONENTS system thread REQUIRED)
if (Boost_FOUND)
    message(STATUS "Found Boost: ${FOLLY_LIBRARIES}")
    INCLUDE_DIRECTORIES(${Boost_INCLUDE_DIRS})
    LINK_LIBRARIES(${Boost_LIBRARIES})
endif (Boost_FOUND)

find_package(folly REQUIRED)
if (folly_FOUND)
    message(STATUS "Found folly: ${FOLLY_LIBRARIES}")
    INCLUDE_DIRECTORIES(${folly_INCLUDE_DIRS})
    LINK_LIBRARIES(${FOLLY_LIBRARIES})
endif (folly_FOUND)

find_package(AWSSDK REQUIRED COMPONENTS s3 appconfig appconfigdata)

add_library(sfx_server_library
        src/lib.cc src/lib.h
        src/services/config/aws/init.cpp src/services/config/aws/init.h
        src/utils/md5.cc
        src/utils/mime.h src/utils/mime.cpp
        src/services/markdown/markdown.cpp src/services/markdown/mdtransform.hpp src/services/markdown/markdown.h
        src/services/config/aws/appconfig.cpp src/services/config/aws/appconfig.h src/services/database/postgresql/pq.cpp
        src/services/database/postgresql/pq.h src/services/database/postgresql/init.cpp src/services/database/postgresql/init.h src/server/handlers/sitemap.cpp src/server/handlers/sitemap.h src/models/article.cpp src/models/article.h src/utils/datetime.cpp src/utils/datetime.h)

find_library(PQXX_LIB pqxx)
find_library(PQ_LIB pq)

target_link_libraries(sfx_server_library ${AWSSDK_LINK_LIBRARIES} ${AWSSDK_PLATFORM_DEPS})
target_link_libraries(sfx_server_library ${PQXX_LIB} ${PQ_LIB})

add_executable(sfx_server src/bin/main.cc)
target_link_libraries(sfx_server sfx_server_library)
add_dependencies(sfx_server sfx_server_library)