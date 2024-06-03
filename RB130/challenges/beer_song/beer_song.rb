class BeerSong

  def self.verse(amount)
    if amount.zero?
      return "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    elsif amount == 1
      return "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    else  
      "#{amount} #{amount > 1 ? 'bottles' : 'bottle'} of beer on the wall, #{amount} #{amount > 1 ? 'bottles' : 'bottle'} of beer.\nTake #{amount == 1 ? 'it' : 'one'} down and pass it around, #{amount-1} #{amount - 1 > 1 ? 'bottles' : 'bottle'} of beer on the wall.\n"
    end
  end

  def self.verses(*bottles)
    output = ""

    bottles.first.downto(bottles.last) do |amount|
      output += verse(amount)
      output += "\n" unless amount == bottles.last
    end

    output
  end

  def self.lyrics
    verses(99, 0)
  end
end