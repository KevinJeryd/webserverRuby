def even_fibonaci()

    fibonacci = 1

    fibonacci_array = []

    fibonacci_array << 1
    fibonacci_array << 1

    puts 1
    puts 1

    i = 2

    while i <= 100

        fibonacci = fibonacci + fibonacci_array[i-2].to_i

        fibonacci_array << fibonacci

        if fibonacci % 2 == 0
            puts fibonacci
            puts()
            puts()
        end

        i += 1

    end

end

puts even_fibonaci()