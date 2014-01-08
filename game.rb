pages_with_questions = {}

lines_grabbed = ""
key = ""
 
File.open("story.txt", "r") do |infile|
	while (line = infile.gets) # while there are lines of text in the document i.e. 
		#until the end of the document, do the following:
		if line.index("~p") #everytime ~p occurs, there will be an integer 
			#equal to the index value and since integers are 'true', the statement will 
			#evaluate to false where there is no instance of ~p, i.e. the 
			#questions and answers
			key = line #while there is a ~p, key will be equal to that line of text and
			lines_grabbed = "" #lines_grabbed will be an empty string
		else #where there is no instance of ~p, i.e. what text corresponds to that particular
			#~p
			lines_grabbed += line #lines_grabbed equals the next line of text because
			#empty string concat next line of text
		end
		#once there are no more lines of text...
		pages_with_questions[key] = lines_grabbed #putting the key i.e. the instance of ~p, 
		#and the value, i.e. following line of text into the hash
		
	end
end

p1 = pages_with_questions.select do |key,value| # creates a new hash of only keys that contain ~p1
	key.index("~p1")
end

p1.each do |k,v| #prints each value of each of the keys that contains ~p1 i.e. print the directions
	puts v
end

#need to create a new hash where you give the the choices and a corresponding key
#so the user only types the key and not the actual exact value i.e. just type "c1" rather
#than "Use Gordon Ramsey's recipe?" EXACTLY, which would be a nightmare.

#need to pull the values of the keys that contain ~p1:c* and assign simpler key values for 
#the user to type

choices = pages_with_questions.select do |key, value|
	key.index("~p1:c") # separates only the choices from original hash. #1 => "~p1:c1:p2", 2 => "~p1:c2:p3", 
#3 => "~p1:c3:p4"}
end

#ask user for their choice 1, 2, or 3

#if their choice equals the hash key, print out the value text that 
#corresponds to that key in pages_with_questions
