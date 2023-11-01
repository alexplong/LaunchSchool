=begin
Difficulty: ___

Given: an array containing hashes of names

Return: a string formatted as a list of names separated by commas except for
the last two names, which should be separated by an ampersand.

Example:

list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ])
# returns 'Bart, Lisa & Maggie'

list([ {name: 'Bart'}, {name: 'Lisa'} ])
# returns 'Bart & Lisa'

list([ {name: 'Bart'} ])
# returns 'Bart'

list([])
# returns ''

Note: all the hashes are pre-validated and will only contain A-Z, a-z, '-' and '.'.

=end


list([{name: 'Bart'},{name: 'Lisa'},{name: 'Maggie'},{name: 'Homer'},{name: 'Marge'}]) == 'Bart, Lisa, Maggie, Homer & Marge' # "Must work with many names"
list([{name: 'Bart'},{name: 'Lisa'}]) == 'Bart & Lisa'# "Must work with two names"
list([{name: 'Bart'}]) == 'Bart'