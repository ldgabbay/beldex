# Apply local fixes to loki-mq submodule

set(LOKI_MQ_PATCH
    "${CMAKE_CURRENT_SOURCE_DIR}/../cmake/patch/loki-mq/001-fix-libzmq-cmake.patch"
)

if(EXISTS "${LOKI_MQ_PATCH}")
  message(STATUS "Applying loki-mq local patch")

  execute_process(
    COMMAND patch -p1 -N -i "${LOKI_MQ_PATCH}"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../external/loki-mq"
    RESULT_VARIABLE _patch_result
)


  if(NOT _patch_result EQUAL 0 AND NOT _patch_result EQUAL 1)
    message(FATAL_ERROR "Failed to apply loki-mq patch")
  endif()
endif()
