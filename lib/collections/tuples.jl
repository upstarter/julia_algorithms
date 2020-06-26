julia> x = (a=1, b=2)
(a = 1, b = 2)

julia> x.a
1

julia> x[:a]
1

julia> keys(x)
(:a, :b)

julia> values(x)
(1, 2)

julia> collect(x)
2-element Array{Int64,1}:
 1
 2

collect(pairs(x))
# 2-element Array{Pair{Symbol,Int64},1}:
#  :a => 1
#  :b => 2
