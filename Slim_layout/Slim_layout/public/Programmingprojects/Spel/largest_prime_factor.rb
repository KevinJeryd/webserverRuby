def factorisation(num)

    divisible_array = []

    test_if_divisible = 2

        while test_if_divisible <= num
            
            if num % test_if_divisible == 0
                divisible_array << test_if_divisible
            end

            test_if_divisible += 1

        end
    prime = 0
    i = 1
    almost_prime_array = []
    prime_array = []

        while i <= num
            prime = divisible_array[i].to_i % i
            almost_prime_array << prime
            i += 1
        end

        iterations = 0
        while iterations < almost_prime_array.length
            if almost_prime_array[i].is_a? Integer
                prime_array << prime
            end
        iterations += 1
        end

        puts prime_array
end

factorisation(500)