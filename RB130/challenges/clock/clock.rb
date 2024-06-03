class Clock
  attr_accessor :hour, :min

  def self.at(hr, min=0)
    obj_hr = hr > 24 ? hr % 24 : hr
    obj_mn = min
    curr_clock = Clock.new

    curr_clock.hour = obj_hr
    curr_clock.min = obj_mn

    curr_clock
  end

  def to_s
    "#{"%02d" % hour}:#{"%02d" % min}"
  end

  def +(mins)
    update_time(mins)
  end

  def -(mins)
    update_time(-mins)
  end

  def ==(other)
    hour == other.hour && min == other.min
  end

  private

  def update_time(mins)
    transformed_hour, transformed_mins = mins_to_hour_and_mins(mins)

    new_mins = min + (transformed_mins)

    case new_mins
    when (60...) 
      hour_fix, mins_fix = new_mins.divmod(60)
      transformed_hour += hour_fix
      new_mins = mins_fix
    when (...0)
      mins_fix = 60 + new_mins
      transformed_hour -= 1
      new_mins = mins_fix
    end

    new_hour = hour + (transformed_hour)
    new_hour = new_hour % 24

    Clock.at(new_hour, new_mins)
  end

  def mins_to_hour_and_mins(mins)
    transformed_hour, transformed_mins = mins.abs.divmod(60)

    if mins < 0
      transformed_hour *= -1
      transformed_mins *= -1
    end

    [transformed_hour, transformed_mins]
  end
end