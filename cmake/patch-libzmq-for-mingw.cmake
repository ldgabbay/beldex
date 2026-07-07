if(NOT DEFINED LIBZMQ_SOURCE_DIR OR LIBZMQ_SOURCE_DIR STREQUAL "")
    message(FATAL_ERROR "LIBZMQ_SOURCE_DIR is required")
endif()

set(libzmq_cmake_lists "${LIBZMQ_SOURCE_DIR}/CMakeLists.txt")
if(NOT EXISTS "${libzmq_cmake_lists}")
    message(FATAL_ERROR "Missing ${libzmq_cmake_lists}")
endif()

file(READ "${libzmq_cmake_lists}" libzmq_cmake)
string(REPLACE "ws2_32.lib" "ws2_32" libzmq_cmake "${libzmq_cmake}")
string(REPLACE "rpcrt4.lib" "rpcrt4" libzmq_cmake "${libzmq_cmake}")
string(REPLACE "iphlpapi.lib" "iphlpapi" libzmq_cmake "${libzmq_cmake}")
file(WRITE "${libzmq_cmake_lists}" "${libzmq_cmake}")
