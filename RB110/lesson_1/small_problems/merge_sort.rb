require "pry"

def merge(a, b)

  a_counter = 0
  b_counter = 0
  merged_output = []

  loop do

    if a.empty? || b.empty?
      return a + b
    elsif a_counter >= a.length && b_counter < b.length
      merged_output << b[b_counter]
    elsif b_counter >= b.length && a_counter < a.length
      merged_output << a[a_counter]
    else

      case a[a_counter] <=> b[b_counter]
      when 0
        merged_output << a[a_counter] << b[b_counter]
        a_counter += 1
        b_counter += 1
      when -1
        merged_output << a[a_counter]
        a_counter += 1
      when 1
        merged_output << b[b_counter]
        b_counter += 1
      end
    end
    
    break if merged_output.length >= (a.length + b.length)
  end
  merged_output
end


def merge_sort(array)
  


end



p merge_sort([9, 5, 7, 1]) #== [1, 5, 7, 9]
