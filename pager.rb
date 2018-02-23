# create a method that will accept a 10 character string and convert the 

def yellow_pager(word)
    
    length = word.length
    if length != 10
        puts "ERROR - string must be 10 characters long"
        return
    end
    
    #store our results in a variable
    
    phone_number= ""
    
    word.each_char do |character|
        case character
        when "A", "B", "C"
            puts 2
        when "D", "E", "F"
            puts 3
        when "G", "H", "I"
            puts 4
        when "J", "K", "L"
            puts "5
        when "M", "N", "O"
            puts 6
        when "P", "Q", "R", "S"
            puts 7
        when "T", "U", "V"
            puts 8
        when "W", "X", "Y", "Z"
            puts 9
        else
            puts "NOPE"
    end
    
    
end

# letters to number. if longer than 10 characters, return false
# for each character in the string print the corresponding number

#lets call the method

yellow_pager("IAMTOMMYAZ")
yellow_pager("CATS")