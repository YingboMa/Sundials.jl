using BinaryProvider # requires BinaryProvider 0.3.0 or later

# Parse some basic command-line arguments
const verbose = "--verbose" in ARGS
const prefix = Prefix(get([a for a in ARGS if a != "--verbose"], 1, joinpath(@__DIR__, "usr")))
products = [
    LibraryProduct(prefix, String["libsundials_cvode"], :libsundials_cvode),
    LibraryProduct(prefix, String["libsundials_nvecserial"], :libsundials_nvecserial),
]

write_deps_file(joinpath(@__DIR__, "deps.jl"), products)
