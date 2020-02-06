def palindrome(input)
    new_word = ""
    
    i = input.length
    
    while i > 0
      new_word = new_word + input[i-1]
      i = i - 1
    end
    
    if input.downcase == new_word.downcase
      puts "The word is a palindrome"
    else
      puts "The word is not a palindrome"
    end
    
  end
  
  input = "Deleveled"
  
  puts palindrome(input)
  
  