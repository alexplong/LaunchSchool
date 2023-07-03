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

### data structure - 