# Behold this incomplete class for constructing boxed banners.

# Complete this class so that the test cases shown below work as intended. 
# You are free to add any methods or instance variables you need. 
# However, do not make the implementation details public.

# You may assume that the input will always fit in your terminal window.

# Further Exploration
# Modify this class so new will optionally let you specify a fixed banner width at the time the Banner 
# object is created. The message in the banner should be centered within the banner of that width. 
# Decide for yourself how you want to handle widths that are either too narrow or too wide.

class Banner
  def initialize(message, width=false)
    @message = message
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    if @width
      "+-#{'-' * (@width - 4)}-+"
    else
      "+-#{'-' * @message.size}-+"
    end
  end

  def empty_line
    if @width
      "| #{' ' * (@width - 4)} |"
    else
      "| #{' ' * @message.size} |"
    end
  end

  def message_line
    if @width
      "| #{@message.center(@width - 4)} |"
    else
      "| #{@message} |"
    end
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

banner = Banner.new('To boldly go where no one has gone before.', 65)
puts banner

banner = Banner.new('', 65)
puts banner