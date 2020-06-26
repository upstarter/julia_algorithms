# It is well known that the standard recursive implementation of the Fibonacci function defined by
#
# F(0) = 0
# F(1) = 1
# F(n) = F(n-1) + F(n-2) for n > 1
# runs in exponential time. Therefore most often the Fibonacci function is implemented either iteratively

function itfib(n)
    x,y = BigInt(0), BigInt(1)
    for i in 1:n
        x,y = y, x+y
    end
    return x
end
# or by matrix exponentation

const b = [ BigInt(1) 1; 1 0]

function mfib(n)
    if n == 0
        return 0
    elseif n == 1
        return 1
    else
        return (b^(n+1))[2,2]
    end
end

# The underlying algorithms run in linear time. Using a divide-and-conquer
# strategy for matrix exponentation we get an algorithm running in time O(log
# n):
function pow(a,n)   # n > 0 !
    if n == 1
        return a
    else
        c = pow(a, n >> 1)
        if iseven(n)
            return c*c
        else
            return c*c * a
        end
    end
end

function afib(n)
    if n == 0
        return 0
    elseif n == 1
        return 1
    else
        return (pow(b,n+1))[2,2]
    end
end
# Another implementation running in time O(log n) uses for n>1Dijkstra’s recurrence equation
#
# F(2n)  = F(n) ( 2F(n-1) + F(n) )
#
# F(2n+1) = F(n)^2 + F(n+1)^2
# and memoization:

const fibmem = Dict{Int,BigInt}()
function fib(n)
    get!(fibmem, n) do
        if n <= 0
            return BigInt(0)
        elseif n == 1
            return BigInt(1)
        else
            m = n >> 1
            if iseven(n)
                return fib(m)*(2*fib(m-1) + fib(m))
            else
                return fib(m+1)^2 + fib(m)^2
            end
        end
    end
end
# I tested the iterative version itfib for 10^7 and all the other version for 10^9 and got the following results
#
# @elapsed(fib(10^9)) = 12.006108423
#
# @elapsed(afib(10^9)) = 52.248328254
#
# @elapsed(mfib(10^9)) = 78.922591838
#
# @elapsed(itfib(10^7)) = 882.27293546
