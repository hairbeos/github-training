class Animal
  def eat food
    puts "#{self.class.name} eats #{food}"
  end
end

module AnimalBehavior
  def eat food
    puts "#{self.class.name} eats #{food}"
  end

  def go
  	puts "#{self.class.name} can go"
  end
end

class Dog < Animal
	include AnimalBehavior
end

class Cat < Animal
	include AnimalBehavior
end

dog = Dog.new
dog.eat 'Shit'
dog.go

cat = Cat.new
cat.eat 'Dog'
cat.go
