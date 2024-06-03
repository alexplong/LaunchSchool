## GOLDEN GIRLS SPIKE
# + The girls live in a house with an address of 6151 Richmond Street Miami, FL. There are four inhabitants of the house:
# - + Dorothy Zbornak
# - + Blanche Deveraux
# - + Rose Nylund
# - + Sofia Petrillo

# + All of the girls are American, except for Sofia-- she's Italian. All the girls work, except for Sofia. All of them are widows, except for Dorothy.
# - + Only Dorothy stays home on Saturday evenings.
# - + Only Rose has a long-term boyfriend.
# - + Only Blanche dates younger men.
# - + All of the girls are over 50.
# - + Dorothy has an ex-husband by the name of Stan Zbornak.

class Home
  attr_accessor :inhabitants

  def initialize(address)
    @address = address
  end
end

miami_home = Home.new('6151 Richmond Street Miami, FL.')

class Girl
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoldenGirl < Girl
  attr_accessor :nationality, :employed, :widower, :saturday_evenings, :long_term_boyfriend, :dates_younger_men, :ex_husband

  def initialize(name)
    super
  end

  def age?
    "Rude for asking! Yes, #{name} is > 50"
  end
end

# The girls live in a house with an address of 6151 Richmond Street Miami, FL. There are four inhabitants of the house. 
dorothy_zbornak = GoldenGirl.new('Dorothy Zbornak')
blanche_deveraux = GoldenGirl.new('Blanche Deveraux')
rose_nylund = GoldenGirl.new('Rose Nylund')
sofia_petrillo = GoldenGirl.new('Sofia Petrillo')

golden_girls = [dorothy_zbornak, blanche_deveraux, rose_nylund, sofia_petrillo]
miami_home.inhabitants = golden_girls

# All of the girls are American, except for Sofia-- she's Italian. 
# All the girls work, except for Sofia. 
# All of them are widows, except for Dorothy.
golden_girls.each do |golden_girl|
  golden_girl.nationality = "American"
  golden_girl.employed = true
  golden_girl.widower = true
  
  golden_girl.nationality = 'Italian' if golden_girl.name == 'Sofia Petrillo'
  golden_girl.employed = false if golden_girl.name == 'Sofia Petrillo'

  golden_girl.widower = false if golden_girl.name == 'Dorothy Zbornak'
end

# p miami_home.inhabitants

# - Only Dorothy stays home on Saturday evenings.
dorothy_zbornak.saturday_evenings = 'stays home'

# - Only Rose has a long-term boyfriend.
rose_nylund.long_term_boyfriend = true

# - Only Blanche dates younger men.
blanche_deveraux.dates_younger_men = true

# - All of the girls are over 50.
puts golden_girls.map(&:age?)

# - Dorothy has an ex-husband by the name of Stan Zbornak.
dorothy_zbornak.ex_husband = 'Stan Zbornak'