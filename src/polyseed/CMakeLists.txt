add_library(polyseed_wrapper
    pbkdf2.c
    polyseed.cpp
)

# Link dependencies
target_link_libraries(polyseed_wrapper
    PUBLIC
        epee
        sodium
        polyseed
        utf8proc
    PRIVATE
        extra
)