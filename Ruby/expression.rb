# Operator expressions
class Person
  attr_reader :first, :last
  def initialize(first, last)
    @first = first
    @last = last
  end
  def full
    "#{:first} #{:last}"
  end

  def +(person)
    "#{self.first} #{person.first}"
  end
end

p1 = Person.new("First", "Last")
p p1.full
p2 = Person.new("Name", "LastName")
p p1 + p2

# Assignment
class Test
  def val=(val)
    @val = val
    return 99
  end
end

t = Test.new
result = (t = 2)
p result

a = 1
a *= 2 while a < 10
p a #
a -= 1 until a < 2
p a