def fizzbuzz()

    i = 0

    fizz = "fizz"
    buzz = "buzz"

    while i <= 100
        if i % 15 == 0
            puts fizz + buzz
        elsif i % 3 == 0
            puts fizz
        elsif i % 5 == 
            puts buzz
        else
            puts i
        end
        i = i + 1
    end

end

fizzbuzz()