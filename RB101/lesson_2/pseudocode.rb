a method that returns the sum of two integers
Informal
# 1. Given a pair of two integers
# 2. Get the sum of the two integers
# 3. Return the sum
Formal
# START
# given a pair of numbers called x and y
# SET answer = sum of x and y
# PRINT answer
# END



a method that takes an array of strings, and returns a string that is all those strings concatenated together
Informal
# 1. Given an array of strings
# 2. Create an empty varaible to store new concatenated strings
# 3. Iterate through the array collection
# =>    for each string, append value + whitespace to empty variable created earlier
# 4. Return the variable with the concatenated strings
Formal
# Start
# given an array of strings called arr
# SET iterator = 1
# SET response = value within arr collection at index 0
# WHILE iterator < length of arr
    # SET current_string = value within arr collection at space "iterator"
    # SET response << current_string + " "
    # iterator += 1
# PRINT response



a method that takes an array of integers, and returns a new array with every 
other element from the original array, starting with the first element.
Informal
# 1. Given an array of numbers
# 2. Create an empty array to store the filtered elements
# 3. Iterate through the array collection
# =>    for each value at an even index or 0, push the value to the new empty array
# 4. Return the new array containing the filtered elements
Formal
# START
# given an array of integers called numbers
# SET iterator = 0
# SET every_other = []
# WHILE iterator <= length of numbers - 1
    # IF iterator is 0 or is an even number
    #   push or add the value to every_other
    # iterator += 1
# PRINT every_other



a method that determines the index of the 3rd occurrence of a given character 
in a string. For instance, if the given character is 'x' and the string is
'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the 
given character does not occur at least 3 times, return nil.
Informal
# 1. Given a string and a character
# 2. Create a counter variable and set it to 0
# 3. Create a response and set it to nil
# 4. Iterate through the string, keep track of value and index
# =>    for each iteration, check if the value is equal to character and add 1 to counter if found
# 5. If counter is equal to 3 return the index otherwise return 
Formal
# START
# given a string called str and a character called char
# SET counter = 0
# SET iterator = 0
# SET response = nil
# WHILE iterator < length of str
    # IF str at position iterator is equal to char
    #   counter += 1
    # IF counter is equal to 3
    #   response = iterator
# PRINT response



a method that takes two arrays of numbers and returns the result of merging 
the arrays. The elements of the first array should become the elements at the
even indexes of the returned array, while the elements of the second array 
should become the elements at the odd indexes.
Informal
# 1. Given two arrays of numbers called a and b
# 2. Create a response variable and set it to an empty array
# 3. Create an iterator and set it to 0
# 4. Iterate through arr a and b using going by position using the iterator variable
# =>    for each iteration, push value from collection a and then push value from collection b to response
# 5. Return response
Formal
# START
# given two arrays of numbers called a and b
# SET response = []
# SET iterator = 0
# WHILE iterator < a.length
    # push value from a at position iterator to response
    # push value from b at position iterator to response
    # iterator += 1
# PRINT response