def reverse(input)
    newString = ""
    i = input.length

    while i > 0
        newString = newString + input[i-1]
        i = i - 1
    end

    return newString
end

input = "Kevin"

puts reverse(input)