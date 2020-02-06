def hangman()

    file_content = File.readlines("words.txt")
    answer = file_content.sample.chomp
    answer_char = answer.chars
    life = 10
    dashes = []
    dashes << "-"*answer.length

    puts(answer)
    puts("Welcome to hangman!")
    puts("If you please will guess the secret word.")
    puts(dashes)

    guess = gets.chomp
    guess_char = []

    while life > 0 and answer_char != [] and guess != answer

        if answer.include? guess
            guess_char << guess
            puts("Yes, " + guess_char.to_s + " is in the word.")
            puts("Letters tried are : " + guess_char.to_s)
            answer_char.delete(guess)
        else
            guess_char << guess
            puts("No, that's not correct, try again")
            puts("Letters tried are : " + guess_char.to_s)
            life = life - 1
        end

        puts("Take another guess!")
        puts(dashes)
        guess = gets.chomp

        if answer.include? guess
            answer_char.delete(guess)
        end

    end

    if life > 0
    puts("Congratulations, " + answer.chomp + " is the right answer!")
    else
    puts("You lose! Better luck next time.")
    end

end
hangman()