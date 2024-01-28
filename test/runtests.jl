using QEDevents
using Test
using SafeTestsets

begin
    @time @safetestset "sampler interfaces" begin
        include("interfaces/sampler_interface.jl")
    end
end
