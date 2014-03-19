def balancing(input)
	types = ["(", "[", "{"]
	compare = [")", "]", "}"]

	typecount = 0
	types.each do |bracket|
		count = 0
		while count < input.length do
			case input[count]
			when bracket
				if input[count+1] == compare[typecount]
					input.delete_at(count)#remove bracket at index
					input.delete_at(count)#removes closing bracket at new index after last deletion
					break if input.length == 0 #exits loop if the array is empty, meaning all brackets have been matched
					balancing(input) #recursive funtion call to run function again on updated array with removed match
				end
			end #case to look for closing bracket matched with opening bracket
			count += 1
		end #while loop to iterate through each array item to match passed bracket type
		typecount+=1
	end #iterative loop to search for each type of bracket
return input
end #recursive function to subtract matching brackets from a string

def get_brackets(input)
	brackets = Array.new
	input.each_char do |i| 
		case i
		when "(", "[", "{", ")", "]", "}"
			brackets << i		
		end #case that adds brackets to array
	end #iterative loop to add brackets to array

	if brackets.length == 0 #Checks that the string has any brackets
		puts "There aren't any brackets in that string."
	elsif balancing(brackets).length == 0 #calls recursive function to match brackets
		puts "The brackets match!"
	else
		puts "The brackets don't match."
	end
end #function to strip all non bracket characters from the string, feed them into an array, and pass array to recursive function

puts "Enter a string please friendo:"
user_input = gets

get_brackets(user_input)