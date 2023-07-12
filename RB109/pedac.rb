# PEDAC Process

# understand the...
  # [P]roblem
  # [E]xamples/Test Cases
  # [D]ata Structure
  # [A]lgorithm
  # [C]ode

# Process the problem
  ### - Understand the problem: - identify the expected I/O - make requirements explicit - identify rules - mental model of the problem
  ### - Example/Test Case: - validate understanding of the problem
  ### - Data Structure: - how do we represent the data that we will work with when converting the input to output
  ### - Algorithm: - steps for converting input to output
# Code with Intent
  ### - Code: Implementation of Algorithm

# example problem
# Suppose you have an arbitrary natural number (the target) and a set of one or more additional
# natural numbers (the factors). Write a program that computes the sum of all numbers from 1 up
# to the target number that are also multiples of one of the factors. 

# For instance, if the target is 20, and the factors are 3 and 5, that gives us the list of
# multiples 3, 5, 6, 9, 10, 12, 15, 18. The sum of these multiples is 78.

# If no factors are given, use 3 and 5 as the default factors.
    ## target:    20
    ## factors:   [3,5]
    ## multiples: [3, 5, 6, 9, 10, 12, 15, 18] 
    ## sum:       78

### identify expected input(s) and output(s)
# inputs: 
    ### - a target number, an integer
    ### - set of one or more factors, an array of integers
# output:
    ### - sum of multiples, an integer

### make requirements explicit
# implicit requirements - some subtle implicit concepts such as multiples
    ### - multiples to be summed must be unique (this requirement not stated explicitly)
    ### - up to the target number, so target number not included in multiple
    ### - natural numbers are set of integers greater than or equal to 0 or 1
# clarifying questions?
    ### - what are the possible values for target number? Are negative numbers allowed?
          # any natural number greater than 0. there will always be a target number
    ### - how will factors be provided to the program?
          # as an array
    ### - what happens if only one number is provided as a factor? should the program assume a second factor is needed?
          # no, default only to 3 and 5 when no factors have been provided

### the mental model 
    # our summary view of the "entire problem" => our prespective on what problem requires
    # => note that we're not yet interested in HOW to solve the problem (the algorithm)
    # no need to come up with multiple models, just showing perspective. but be sure your
    # model fully and accurately captures the requirements

  # mental model # 1
    ### - determine a list of all multiples of a set of factors up to a target value
    ### - filter the list of multiples to the unique values
    ### - computer and return the sum of the unique multiple values
  # mental model # 2
    ### - incrementally build a list of numbers that are multiples of a set of one or more factors
    ### - add a multiple to the list only if it is not yet on the list
    ### - computer and return the sum of the numbers on the list

### examples/test cases - confirmation will typically come from a person or documentation of a process
# can ask the person to confirm the output given the input or can follow the process to check the output given the input
# examples were derived from the rules, an excellent place to find test cases
# in addition to test cases based on our rules, we should also provide test cases that handle any edge cases we can find
# edge cases - are inputs at the "edges" of the problem description that may be mishandled if we aren't careful
    # example 1
      # inputs:
        # target number: 20
        # factors: [3, 5]
      # output:
        # sum: 78
    # example 2
      # inputs:
        # target number: 20
        # factors: [3]
      # output:
        # sum: 63
    # example 3
      # inputs:
        # target number: 20
        # factors: [5]
      # output:
        # sum: 30
     # example 4
      # inputs:
        # target number: 20
        # factors: []
      # output:
        # sum: 78
    # example 5
      # inputs:
        # target number: 1
        # factors: []
      # output:
        # sum: 0
# typical edge cases involve working with neg nums, the num zero, or extremely high values
# when working with collections, its normally a good idea to find test cases that deal with zero,
# one, or multiple elements in the collection
    # example 6 edge case
      # inputs:
        # target number: 20
        # factors: [19]
      # output:
        # sum: 19

### data structure - use developed mental models to determine data strucutres we will work with to convert input to output
# array seems like a good fit 
# data structure will influence your algorithm

### algorithm - objective is to determine a series of instructions that will transform the input to desired output
# challenge is to get the right level of detail - something that can readily be converted to code without actually writing code
# don't want it written at programming level so you don't lose flexibility during implementation
# programming languages often provide several ways to achieve a given result, but each of those approaches can affect other parts of the program
# if you implement a choice too soon by making it part of your algorithm, then later discover you should have chosen something else
# you'll then need to go back and modify both the code and alogorithm
# its not uncommon to change an algorithm once coding starts so don't feel constrained

  # mental model # 2
    ### - incrementally build a list of numbers that are multiples of a set of one or more factors
    ### - add a multiple to the list only if it is not yet on the list
    ### - computer and return the sum of the numbers on the list
  # my mental model
    ### - 

# model 1 
# 1. create an empty array called multiples that will store the multiple values
# 2. check if factors list is empty, if empty set the factors list to [3, 5]
# 3. for every factor in factors
#     1. set current_multiple to factor to keep track of the multiples of factor
#     2. while current_multiple < target
#         1. append current_multiple to multiples
#         2. add factor to current_multiple
# 4. filter the multiples array and keep only unique values
# 5. take sum of the array and return the sum value

# model 2
# 1. create an empty array called multiples that will store the values
# 2. check if factors list is empty, if empty set factors list to [3, 5]
# 3. for every factor in factors
#     1. set current_multiple to factor to keep track of multiples of factor
#     2. while current_multiple < target
#         1. is current_multiple already in multiple?
#             1. Yes - do nothing
#             2. No - append current_multiple to multiple
#     3. add factor to current_multiple
# 4. take sum of the array and return the sum value

# my model algorithm
# 1. create an empty array called multiples that will store the multiple values
# 2. check if factors list is empty, if empty set the factors list to [3, 5]
# 3. iterate from 1 up to the target number
#     1. for every factor in factors
#         1. check if iterating number is divisible by factor
#             1. Yes - append iterating value to multiples array and break from loop
#             2. No - do nothing
# 4. take sum of all numbers from multiples array and return the sum value

# model 1
def sum_of_multiples(target, factors)
  multiples = []
  factors = [3, 5] if factors.empty?

  factors.each do |factor|
    current_multiple = factor
    while current_multiple < target
      multiples << current_multiple
      current_multiple += factor
    end
  end
  multiples.uniq!
  multiples.sum
end

# model 2
def sum_of_multiples2(target, factors)
  multiples = []
  factors = [3, 5] if factors.empty?

  factors.each do |factor|
    current_multiple = factor
    while current_multiple < target
      multiples << current_multiple if !multiples.include?(current_multiple)
      current_multiple += factor
    end
  end
  multiples.sum
end

# my model
def sum_of_multiples3(target, factors)
  multiples = []
  factors = [3, 5] if factors.empty?
  for i in 1...target do
    factors.each do |factor|
      if i % factor == 0
        multiples << i
        break
      end
    end
  end
  multiples.sum
end