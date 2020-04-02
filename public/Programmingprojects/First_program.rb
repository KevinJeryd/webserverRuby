#String methods
phrase = "Kevin Jeryd"
puts phrase.upcase() #Eller downcase
phrase_2 = "    Kevin Jeryd   "
puts phrase_2.strip() #Tar bort onödigt mellanrum
puts phrase.length() #Säger oss hur många tecken en string innehåller
puts phrase.include? "Ke" #Säger oss om en viss fras eller karaktär finns inuti en string
puts phrase[0, 3] #Ger oss tecknet/tecknen som är på den platsen
puts phrase.index("e") #Säger oss vilken position det givna tecknet har

#Få information från användaren
puts "Enter your name"
name = gets.chomp() #Gets är en funktion som kräver något input från användaren, .chomp gör att det inte blir en ny rad efter din info
puts "Enter your age"
age = gets.chomp()
puts "Hello " + name + " you are " + age + " years old"

#Arrays
friends = ["Sample1", "Sample2", "Sample3"] #Arrays är en variabel som innehåller flera värden och värdena kan pekas ut beroende på vilket index nummer de har. Arrays böjar på 0
puts friends[0]

newFriends = Array.new #.new innebär att arrayen är tom och att vi kan fylla den själva
newFriends[3] = "Sample3" #Här gav jag Sample3 index 3 i arrayen newFriends

#Hashes är en datastruktur där vi kan lagra information, som arrays. Skillnaden är att hashes kan lagra saker som kallas för "Key value pair". Key value pairs är saker där vi kan spara information och sen ge information en "key" vilket ungefär är namnet på informationen.
states = {
    "Gothenburg" => "GBG",
    "Stockholm" => "STKHLM",
    "Skåne" => "SK",
    1 => "Snopp"
}

puts states["Gothenburg"]

#Methods är ett block av kod som kommer göra en specifik sak för oss
def sayhi(namn="noname", surname="surname") #Genom att ha med likamedstecknet så ger vi variablerna ett default svar om det inte läggs in något innanför parentserna när vi kallar på den
    puts "Hello " + namn + " " + surname
end
#Metoden ovanför är ett block av kod som kommer att säga hej till användaren när den kallas på
sayhi("Kevin", "Jeryd") #För att kalla på den är det bara att skriva ut vad metoden heter, det som står innanför parenteserna är vad som kommer användas som input i metoden

#Return statement används när man vill signalera till ruby att man är klar med metoden, allt efter det kommer inte att executas

#Case expressions is a special type of if statement that checks the same value against multiple different conditions
def get_day_name(day)
    day_name = ""

    case day
        when "mon"
            day_name = "Monday"
        when "tue"
            day_name = "Tuesday"
        when "wed"
            day_name = "Wednesday"
        when "thu"
            day_name = "Thursday"
        when "fri"
            day_name = "Friday"
        when "sat"
            day_name = "Saturday"
        when "sun"
            day_name = "Sunday"
        else
            day_name = "Invalid input"
    end

    return day_name
end

puts get_day_name("mon")

    #for loops
        for i in friends
            puts i
        end

        for i in 0..5
            puts i
        end


    #do loops
        friends.each do |i| 
            puts i
        end

        6.times do |i| 
            puts i
        end

    #exponent method for positive exponents
        def pow(base, exponent)

            result = 1

                exponent.times do
                    result = result * base
                end

            return result
            
        end

        puts pow(2, 5)

    

    


