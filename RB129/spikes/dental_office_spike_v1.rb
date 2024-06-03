## DENTAL OFFICE SPIKE
# + There's a dental office called Dental People Inc.  Within this office, there's 2 oral surgeons, 2 orthodontists, 1 general dentist.
# + Both general dentists and oral surgeons can pull teeth. Orthodontists cannot pull teeth.  Orthodontists straighten teeth.
# + All of these aforementioned specialties are dentists. All dentists graduated from dental school.  Oral surgeons place implants.
# + General dentists fill teeth


# There's a dental office called Dental People Inc.  Within this office, there's 2 oral surgeons, 2 orthodontists, 1 general dentist.
class DentalOffice
  attr_reader :name

  def initialize(name)
    @name = name
    @employees = []
  end
end

p dental_people_inc = DentalOffice.new('Dental People Inc.')



# Both general dentists and oral surgeons can pull teeth. Orthodontists cannot pull teeth.  Orthodontists straighten teeth.
# All of these aforementioned specialties are dentists. All dentists graduated from dental school.  Oral surgeons place implants.
# General dentists fill teeth


module TeethPuller
  def pull_teeth
    # pulling teeth
  end
end

class Dentist
  def initialize
    @dental_school_graduate = true
  end

  def fill_teeth
    # fill teeth
  end
end

class GeneralDentist < Dentist
  include TeethPuller
end

class OralSurgeon < Dentist
  include TeethPuller

  def place_implants
    # placing implants
  end
end

class Orthodontist < Dentist
  def straighten_teeth
    # straighten teeth
  end
end


