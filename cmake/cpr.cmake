# Apply local fixes to cpr submodule

set(CPR_PATCH
    "${CMAKE_CURRENT_SOURCE_DIR}/../cmake/patch/cpr/001-fix-callback.patch"
)

if(EXISTS "${CPR_PATCH}")
  message(STATUS "Applying cpr local patch")

  execute_process(
    COMMAND patch -p1 -N -i "${CPR_PATCH}"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../external/cpr"
    RESULT_VARIABLE _cpr_patch_result
  )

  if(NOT _cpr_patch_result EQUAL 0 AND NOT _cpr_patch_result EQUAL 1)
    message(FATAL_ERROR "Failed to apply cpr patch")
  endif()
endif()