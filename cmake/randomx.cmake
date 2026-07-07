# Apply local fixes to randomx submodule

set(RANDOMX_PATCH
    "${CMAKE_CURRENT_SOURCE_DIR}/../cmake/patch/randomx/001-fix-instructions-portable.patch"
)

if(EXISTS "${RANDOMX_PATCH}")
  message(STATUS "Applying randomx local patch")

  execute_process(
    COMMAND patch -p1 -N -i "${RANDOMX_PATCH}"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../external/randomx"
    RESULT_VARIABLE _randomx_patch_result
  )

  if(NOT _randomx_patch_result EQUAL 0 AND NOT _randomx_patch_result EQUAL 1)
    message(FATAL_ERROR "Failed to apply randomx patch")
  endif()
endif()