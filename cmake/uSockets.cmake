# Apply local fixes to uSockets nested submodule

set(USOCKETS_PATCH
    "${CMAKE_CURRENT_SOURCE_DIR}/../cmake/patch/uSockets/001-fix-bsd.patch"
)

if(EXISTS "${USOCKETS_PATCH}")
  message(STATUS "Applying uSockets local patch")

  execute_process(
    COMMAND patch -p1 -N -i "${USOCKETS_PATCH}"
    WORKING_DIRECTORY
      "${CMAKE_CURRENT_SOURCE_DIR}/../external/uWebSockets/uSockets"
    RESULT_VARIABLE _patch_result
    OUTPUT_VARIABLE _patch_out
    ERROR_VARIABLE  _patch_err
  )

  if(NOT _patch_result EQUAL 0 AND NOT _patch_result EQUAL 1)
    message(FATAL_ERROR
      "Failed to apply uSockets patch:\n${_patch_out}\n${_patch_err}")
  endif()
endif()
