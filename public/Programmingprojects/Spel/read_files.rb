file_content = File.readlines("words.txt")
i = 0
new_array = []
while i < file_content.length 
    temp_str = file_content[i]
    if temp_str.length == 4
        new_array << temp_str
    end
    i = i + 1
end
File.write("3_letters.txt", new_array)