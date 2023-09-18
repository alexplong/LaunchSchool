require 'Date'

def friday_13th(year)


  fridays = (1..12).to_a
  fridays.map { |month| Date.new(year, month, 13).friday? }
         .select { |friday_13th| friday_13th }
         .length
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2