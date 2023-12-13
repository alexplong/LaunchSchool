=begin
Difficulty: medium

Polycarpus works as a DJ in the best Berland nightclub, and he often uses dubstep
music in his performance. Recently, he has decided to take a couple of old songs 
and make dubstep remixes from them.

Let's assume that a song consists of some number of words (that don't contain WUB).
To make the dubstep remix of this song, Polycarpus inserts a certain number of 
words "WUB" before the first word of the song (the number may be zero), after the 
last word (the number may be zero), and between words (at least one between any 
pair of neighbouring words), and then the boy glues together all the words, 
including "WUB", in one string and plays the song at the club.

For example, a song with words "I AM X" can transform into a dubstep remix as 
"WUBWUBIWUBAMWUBWUBX" and cannot transform into "WUBWUBIAMWUBX".

Recently, Jonny has heard Polycarpus's new dubstep track, but since he isn't into 
modern music, he decided to find out what was the initial song that Polycarpus 
remixed. Help Jonny restore the original song.

Input
The input consists of a single non-empty string, consisting only of uppercase 
English letters, the string's length doesn't exceed 200 characters

Output
Return the words of the initial song that Polycarpus used to make a dubsteb remix. 
Separate the words with a space.

Examples
song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB")  =>  WE ARE THE CHAMPIONS MY FRIEND


input: a string (dubstep version)
output: a new string (original)

RULES
- Given a string of words (non-empty input and does not exceed 200 chars)
  - WUB is inserted at these locations:
    - Before the first word (zero or more)
    - After the last word (zero or more)
    - Between each word (at least once)
- Remove the WUB from the given string of words
- Return that string with words separated by spaces

ALGORITHM
- Given a string
- Split the string into an array of words that were separated by 'WUB'
- Reject words from the array if it is an emtpy string
- Join the array of words back to a string separated by spaces
- Return that string


=end

def song_decoder(str)
  str.split('WUB').reject(&:empty?).join(' ')
end

p song_decoder("AWUBBWUBC") == "A B C"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"
