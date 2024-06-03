class Robot
  @@robot_names = []

  def initialize
    reset
  end

  def name
    return @name unless @name.nil?
    @name = generate_random_name
  end

  def reset
    @name = nil
  end

  private

  def generate_random_name
    new_name = nil

    while new_name.nil?
      generated_name = ''
      2.times { generated_name << ('A'..'Z').to_a.sample }
      3.times { generated_name << ('0'..'9').to_a.sample }

      unless @@robot_names.include? generated_name
        new_name = generated_name 
        @@robot_names << new_name
      end
    end

    new_name
  end 
end 