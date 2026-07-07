# Apply local fixes to oxen-encoding submodule

set(OXEN_ENCODING_PATCH
    "${CMAKE_CURRENT_SOURCE_DIR}/../cmake/patch/oxen-encoding/001-fix-serialization.patch"
)

if(EXISTS "${OXEN_ENCODING_PATCH}")
  message(STATUS "Applying oxen-encoding local patch")

  execute_process(
    COMMAND patch -p1 -N -i "${OXEN_ENCODING_PATCH}"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../external/oxen-encoding"
    RESULT_VARIABLE _patch_result
    OUTPUT_VARIABLE _patch_out
    ERROR_VARIABLE  _patch_err
  )

  if(NOT _patch_result EQUAL 0 AND NOT _patch_result EQUAL 1)
    message(FATAL_ERROR
      "Failed to apply oxen-encoding patch:\n${_patch_out}\n${_patch_err}")
  endif()
endif()
