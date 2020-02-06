def calculator()
    num1 = gets.chomp().to_f
    arith = gets.chomp()
    num2 = gets.chomp().to_f

    if arith == "+"
       num3 = num1 + num2
    elsif arith == "-"
       num3 = num1 - num2
    elsif arith == "*"
        num3 = num1 * num2
    elsif arith == "/"
        num3 = num1 / num2
    elsif arith == "^"
        num3 = num1 ** num2
    else
        puts "Error, operation invalid"
    end
    return(num3)
end

puts calculator()