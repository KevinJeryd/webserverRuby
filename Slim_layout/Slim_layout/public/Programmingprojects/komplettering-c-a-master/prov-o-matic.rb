# Puts out information regarding all the students different points, the best student, average points and the median.
#
# students - The array containing all of the different student-files in the class
#
# Examples
#
#   class_answer(students)
#   # => "anna.prov: 12/15\nBästa elev: anna.prov: 12/15"\nMedel: 10.6\nMedian: 12.0"
#
# Returns nothing
def class_answer(students)

    i = 0
    j = 0
    answer = 1
    amount_of_correct_answer = 0
    elev_data = Dir.entries(students)
    elev_data = elev_data[2..elev_data.length - 1]
    student_correct_answer = []
    best_student = ""
    highest_score = 0
    total_score = 0
    average = 0
    median_a = []
    median = 0

    while i < elev_data.length
        student_to_correct = elev_data[i]
        elev_data_length = File.readlines(students+"/"+student_to_correct)

        while j < elev_data_length.length

            
            student_answer = elev_data_length[j][0]
            correct_answer = elev_data_length[j][2]

            if student_answer == correct_answer
                amount_of_correct_answer += 1
            end

            j += 1
        end

        student_and_answer = student_to_correct.to_s + ": " + amount_of_correct_answer.to_s + "/" + j.to_s
        total_score += amount_of_correct_answer

        if amount_of_correct_answer > highest_score
            highest_score = amount_of_correct_answer
            best_student = student_and_answer
        end


        
        student_correct_answer << student_and_answer
        median_a << amount_of_correct_answer
        elev_data_length = 0
        amount_of_correct_answer = 0
        i += 1
        answer += 1
        j = 0

    end

    average = total_score.to_f/i

    if i % 2 == 0
        median = (median_a[i/2] + median_a[i/2+1]).to_f/2
    else
        median = median_a[i.to_f/2]
    end

    puts student_correct_answer
    puts "Bästa elev: " + best_student
    puts "Medel: " + average.to_s
    puts "Median: " + median.to_s
end


# Gets all of the student-files in a given folder
#
# class_filepath - The string containing the name of the folder
#
# Examples
#
#   get_students_loop(class_filepath)
#   => "["anna.prov", "henrik.prov", "boris.prov"]"
#
# Returns an array containging all student-files
def get_students_loop(class_filepath)

    students = Dir.entries(class_filepath)
    students = students[2..students.length - 1]

    return students

end

def full_class()

    puts "Ange sökväg till mappen som innehåller klassens prov"
    class_filepath = gets.chomp

    if !File.exist?(class_filepath)

        puts "Filen existerar inte"
        exit
    end

    students = get_students_loop(class_filepath)

    name = class_answer(class_filepath)

end

def solo_student()
    
    puts "Vilken elevs prov ska rättas?"
    filepath = gets.chomp

    elev_data_length = File.readlines(filepath)

    if !File.exist?(filepath)
        puts "Eleven existerar inte"
        exit
    end

    if !["a", "b", "c", "d", "e", "f"].include?(elev_data_length[0][0])
        puts "Filen är i fel format"
        exit
    end

    i = 0
    answer = 1
    amount_of_correct_answer = 0

    while i < elev_data_length.length

        student_answer = elev_data_length[i][0]
        correct_answer = elev_data_length[i][2]
        

        if student_answer == correct_answer
            puts answer.to_s + ": correct"
            amount_of_correct_answer += 1
        else
            puts answer.to_s + ": incorrect"
        end

        i += 1
        answer += 1

    end

    answer -= 1

    puts amount_of_correct_answer.to_s + "/" + answer.to_s

end

def choose_option()

    puts "Vad vill du göra?"
    puts "1. Kolla enskild elevs prov"
    puts "2. Kolla hel klass prov"

    option = gets.chomp

    if option == "1"
        solo_student()
    elsif option == "2"
        full_class()
    else
        puts "Välj 1 eller 2"
    end

end

choose_option()