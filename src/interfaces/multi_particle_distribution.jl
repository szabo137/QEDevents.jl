
"""

   MultiParticleDistribution

Base type for sample drawing from multiple particle distributions. The following interface functions
should be implemented:

* [`QEDevents._particles(d::MultiParticleDistribution)`](@ref): return
* [`QEDevents._particle_directions(d::MultiParticleDistribution)`](@ref)

"""
const MultiParticleDistribution = ParticleSampleable{MultiParticleVariate}

Broadcast.broadcastable(d::MultiParticleDistribution) = Ref(d)

Base.length(d::MultiParticleDistribution) = length(_particles(d))
Base.size(d::SingleParticleDistribution) = (length(d),)

"""
    _particle(dist::MultiParticleDistribution)

Return tuple of particles associated with the `dist`.

!!! note

    Interface function to be implemented for multi-particle distributions.

"""
function _particles end

"""
    _particle_direction(dist::MultiParticleDistribution)

Return tuple of particle-directions for all particles associated with `dist`.

!!! note

    Interface function to be implemented for multi-particle distributions.

"""
function _particle_directions end
#default
function _particle_direction(d::MultiParticleDistribution)
    return Tuple(fill(UnknownDirection(), length(d)))
end

"""
Interface function, which asserts that the given `input` is valid.
"""
#=
function _assert_valid_input_type(
    d::MultiParticleDistribution, x::PS
) where {
        PS <: Tuple{Vararg{ParticleStateful}
    }
    # TODO: implement correct type check
    nothing
end
=#

# used for pre-allocation of vectors of particle-stateful
# todo: use `_assemble_tuple_type` from QEDprocesses
# function Base.eltype(s::MultiParticleDistribution) end
