module julia_algorithms

greet() = print("hi world")

end # module


#main.jl
using some_package, another_package
#A file with functions and structs etc.
include("custom_functions.jl")
#You can keep your code in a module
push!(LOAD_PATH,path_to_my_module.jl)
using my_module
inputs = ...
results = main(inputs)
#some processing below
#custom_code.jl
function myfunction()
...
end
