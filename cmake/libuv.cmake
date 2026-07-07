# Apply local fixes to libuv submodule

set(LIBUV_PATCH
    "${CMAKE_CURRENT_SOURCE_DIR}/../cmake/patch/libuv/001-fix-cmake-version.patch"
)

if(EXISTS "${LIBUV_PATCH}")
  message(STATUS "Applying libuv local patch")

  execute_process(
    COMMAND patch -p1 -N -i "${LIBUV_PATCH}"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../external/libuv"
    RESULT_VARIABLE _patch_result
  )

  if(NOT _patch_result EQUAL 0 AND NOT _patch_result EQUAL 1)
    message(FATAL_ERROR "Failed to apply libuv patch")
  endif()
endif()