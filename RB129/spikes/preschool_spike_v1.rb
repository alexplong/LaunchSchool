## PRESCHOOL SPIKE
# + Inside a preschool there are children, teachers, class assistants, a principal, janitors, and cafeteria workers. 
# + Both teachers and assistants can help a student with schoolwork and watch them on the playground. 
# + A teacher teaches and an assistant helps kids with any bathroom emergencies. Kids themselves can learn and play. 
# + A teacher and principal can supervise a class. 
# + Only the principal has the ability to expel a kid. 
# + Janitors have the ability to clean. 
# + Cafeteria workers have the ability to serve food. 
# + Children, teachers, class assistants, principals, janitors and cafeteria workers all have the ability to eat lunch.


# Inside a preschool there are children, teachers, class assistants, a principal, janitors, and cafeteria workers. 
class Preschool
  attr_accessor :teachers, :assistants, :students, :principal, :janitors, :cafeteria_workers
end

preschool = Preschool.new

class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def eat
    puts "#{self.name} is having some food."
  end
end

module SharedClassDuties
  def help(student)
    puts "#{self.name} is helping #{student.name} with their schoolwork."
  end
end

module SharedPlaygroundDuties
  def watch(students)
    puts "#{self.name} is making sure students are safe on the playground."
  end
end

module SharedSupervisorDuties
  def supervise
    puts "#{self.name} is supervising a class."
  end
end

class Teacher < Person
  include SharedClassDuties
  include SharedPlaygroundDuties
  include SharedSupervisorDuties

  def teach
    puts "#{self.name} is teaching."
  end
end

class Assistant < Person
  include SharedClassDuties
  include SharedPlaygroundDuties

  def help(student)
    if student.bathroom_emergency?
      puts "#{self.name} is helping a student with an emergency!"
    else
      super
    end
  end
end

class Child < Person
  def learn
    puts "#{self.name} likes to learn."
  end

  def play
    puts "#{self.name} likes to play!"
  end

  def bathroom_emergency?
    [true, false].sample
  end
end

# Both teachers and assistants can help a student with schoolwork and watch them on the playground.
sally = Child.new('Sally')
bobby = Child.new('Bobby')
class_of_2050 = [sally, bobby]

steve = Teacher.new('Mr. Steve')
shawn = Assistant.new('Shawn')
brook = Assistant.new('Brook')

preschool.students = class_of_2050
preschool.teachers = [steve]
preschool.assistants = [shawn, brook]
p preschool

steve.help(bobby)
shawn.watch(preschool.students)
brook.watch(preschool.students)


# A teacher teaches and an assistant helps kids with any bathroom emergencies. Kids themselves can learn and play. 
steve.teach
shawn.help(bobby)

bobby.learn
bobby.play

# A teacher and principal can supervise a class. 
class Principal < Person
  include SharedSupervisorDuties

  def expel(name, students)
    students.reject! { |student| student.name == name }
    puts "#{name} has been expelled."
  end
end

amber = Principal.new('Principal Amber')
preschool.principal = amber

amber.supervise
steve.supervise

# Only the principal has the ability to expel a kid. 
puts preschool.students
amber.expel('Bobby', preschool.students)
puts preschool.students

# Janitors have the ability to clean. 
class Janitor < Person
  def clean
    puts "#{self.name} is cleaning the school."
  end
end

johnson = Janitor.new('Mr. Johnson')
preschool.janitors = [johnson]

johnson.clean

# Cafeteria workers have the ability to serve food. 
class CafeteriaWorker < Person
  def serve_food
    puts "#{self.name} is serving food at the school."
  end
end

smith = CafeteriaWorker.new('Smith')
sammy = CafeteriaWorker.new('Sammy')
preschool.cafeteria_workers = [smith, sammy]

[smith, sammy].each(&:serve_food)

# Children, teachers, class assistants, principals, janitors and cafeteria workers all have the ability to eat lunch.
[sally, bobby, steve, shawn, brook, amber, johnson, smith, sammy].each(&:eat)



