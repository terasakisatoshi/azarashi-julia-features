#!/usr/bin/env julia

using Pkg
Pkg.activate() # activate the default environment

if isfile(joinpath(@__DIR__, "JULIAPACKAGES"))
    for p in split(read(joinpath(@__DIR__, "JULIAPACKAGES"), String))
        if p in map(info -> info.name, values(Pkg.dependencies()))
            println("Installing package $p")
            Pkg.add(p)
        end
    end
end