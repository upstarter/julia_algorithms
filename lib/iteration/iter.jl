for i in iter   # or  "for i = iter"
    # body
end

# is translated into:
next = iterate(iter)
while next !== nothing
    (i, state) = next
    # body
    next = iterate(iter, state)
end
