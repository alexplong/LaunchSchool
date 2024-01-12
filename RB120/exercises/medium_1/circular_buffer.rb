=begin
Your task is to write a CircularBuffer class that implements a circular buffer for arbitrary objects. The class should obtain the buffer size with an argument provided to CircularBuffer::new, and should provide the following methods:

put to add an object to the buffer
get to remove (and return) the oldest object in the buffer. It should return nil if the buffer is empty.
You may assume that none of the values stored in the buffer are nil (however, nil may be used to designate empty spots in the buffer).
=end

=begin
UNDERSTAND THE PROBLEM
- Input: Integer
- Output: CircularBuffer
RULES
- Given an Integer (n), create a CircularBuffer (carr) of n size
  - Initialize `@buffer` instance variable to reference a new Array of size n
  - Initialize `@start` and `@end` instance variables to use as pointers of the Array
    - `@start` references the index of the CircularBuffer that has the "oldest" value
    - `@end` references the index of the CircularBuffer that a new value can be placed
- `put` method takes a single argument and stores it in the "ending" location of the CircularBuffer
- `get` method takes no argument and returns the "oldest" value in the CircularBuffer with that location referenced by `@start`

ALGORITHM
- Initialize `@buffer` to an Array with size of given input
- Initialize `@start` and `@end` to 0

- Define `put(x)` to store the argument in the 'next' free spot in the CircularBuffer or overwrite the 'oldest' value if full
  - Reassign the the value of `@buffer` at index position `@end` to the value of the argument that was passed in
  - If `@start` and `@end` are equal and `@buffer` no longer contains nil
    - Increment both `@start` and `@end` by 1
  - Else
    - Increment `@end` by 1
  - index_boundary_check

- Define `get` to return the oldest in the CircularBuffer and replace it with nil
  - Create a local variable output and inialize it to reference a copy of the element of `@buffer` at index position `@start`
  - Reassign the value of `@buffer` at position `@start` to nil
  - If output is not 'nil', increment `@start` by 1
  - index_boundary_check
  - Return output

- Define `index_boundary_check`
  - Set `@start` to 0 if `@start` is greater than or equal to size of `@buffer`
  - Set `@end` to 0 if `@end` is greater than or equal to size of `@buffer`
=end

class CircularBuffer
  def initialize(n)
    @buffer = Array.new(n)
    @start = 0
    @end = 0
  end

  def put(n)
    @buffer[@end] = n
    if @start == @end && @buffer.all?
      @start = increment(@start)
      @end = increment(@end)
    else
      @end = increment(@end)
    end
  end

  def get
    output = @buffer[@start].dup
    @buffer[@start] = nil
    @start = increment(@start) unless output.nil?
    output
  end

  private

  def increment(position)
    position += 1
    position = 0 if position >= @buffer.size
    position
  end
end


=begin
ALGORITHM - Using `push` and `shift`
- Initialize `@buffer` to an empty Array
- Initialize `@max_size` to the value referenced by n

- Define `put(x)` to store the argument in the "CircularBuffer"
  - If size of `@buffer` is greater than or equal to `@max_size`
    - Invoke `CircleBuffer#get`
    - Push `x` to `@buffer`
  - Else
    - Push `x` to `@buffer`

- Define `get` to return the oldest in the "CircularBuffer"
  - Remove the 1st element from the Array with `Array#shift`
=end

class CircularBuffer
  def initialize(n)
    @buffer = []
    @max_size = n
  end

  def put(x)
    if @buffer.size >= @max_size
      get
      @buffer.push(x)
    else
      @buffer.push(x)
    end
  end

  def get
    @buffer.shift
  end
end

buffer = CircularBuffer.new(3)
puts buffer.get == nil      # [nil, nil, nil]       @start=0 | @end=0 get nil so NO CHANGE
buffer.put(1)               # [1, nil, nil]         @start=0 | @end=1 put 1 so increment @end
buffer.put(2)               # [1, 2, nil]           @start=0 | @end=2 put 2 so increment @end
puts buffer.get == 1        # [nil, 2, nil]        @start=1 | @end=2 get 1 so increment @start

buffer.put(3)               # [nil, 2, 3]           @start=1 | @end=0 put 3 so increment => reset @end
buffer.put(4)               # [4, 2, 3]             @start=1 | @end=1 put 4 so increment @end
puts buffer.get == 2        # [4, nil, 3]           @start=2 | @end=1 get 2 so increment @start

buffer.put(5)               # [4, 5, 3]             @start=2 | @end=2 put 5 so increment @end
buffer.put(6)               # [4, 5, 6]             @start=0 | @end=0 put 6 but @start == @end so increment => reset both 
buffer.put(7)               # [7, 5, 6]             @start=1 | @end=1 put 7 but @start == @end so increment both
puts buffer.get == 5        # [7, nil, 6]           @start=1 | @end=1 get 5 so increment @start
puts buffer.get == 6        # [7, nil, nil]         @start=2 | @end=1 get 6 so increment => reset @start
puts buffer.get == 7        # [nil, nil, nil]       @start=0 | @end=1
puts buffer.get == nil

buffer = CircularBuffer.new(4)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 4
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil