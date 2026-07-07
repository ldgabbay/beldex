#include "wallet2.h"
#include "serialization/binary_archive.h"
#include "serialization/json_archive.h"
#include "serialization/serialization.h"

namespace tools
{

const char* wallet2::serialize_cache_to_json() const
{
    static std::string json_result;

    try
    {
        json_result = serialization::dump_json(
            const_cast<wallet2&>(*this)
        );
    }
    catch (const std::exception& e)
    {
        json_result =
            "{\"error\":\"Failed to serialize wallet cache: " +
            std::string(e.what()) + "\"}";
    }

    return json_result.c_str();
}

} // namespace tools