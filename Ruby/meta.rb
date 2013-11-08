# Metaprogramming
class Test
  def self.method1
    "#{self}"
  end
end

t = Test.method1
puts t
# puts Test.new.class.method1 # not work

# Singleton
animal = 'cat'
def animal.speak
  puts "#{self} say meo"
end

animal.speak

animal = 'dog'
def animal.speak
  puts "The #{self} says WOOF!"
end
singleton = class << animal
  def lie
    puts "The #{self} lies down"
  end
  self # << return singleton class object end
end

animal.speak
animal.lie
puts "Singleton class object is #{singleton}"
puts "It defines methods #{singleton.instance_methods - 'cat'.methods}"

# Singleton class
class Test
  class << self
    attr_accessor :var
  end
end

puts Test.var = 10
puts Test.var

puts Test.new

# Macros
module AttrLogger
  def attr_logger(name)
    attr_reader name
    define_method("#{name}=") do |val|
      puts "Assigning #{val.inspect} to #{name}"
      instance_variable_set("@#{name}", val)
    end
  end

  def method_name
    puts 'abc'
  end
end

class AttrLoggerSample
  extend AttrLogger
  attr_logger :name
  # attr_accessor :name
  # method_name
end

t = AttrLoggerSample.new
t.name = 'PATAHA'
puts t.name
# puts t.class.methods


# Realworld Macros
module GeneralLogger
  def log(msg)
    puts msg
  end

  module AttrLogger
    def attr_logger(name)
      attr_reader :name
      define_method("#{name}=") do |val|
        log "Assigning #{val.inspect} to #{name}"
        instance_variable_set("@#{name}", val)
      end
    end
  end

  def self.included(host_class)
    host_class.extend(AttrLogger)
  end
end

class AttrLoggerSample
  include GeneralLogger

  attr_logger :val
end

t = AttrLoggerSample.new
t.log('aaaaaaaa')
t.val = 10_000

# Meta send
class Account
  attr_accessor :name, :pass

  def attributes=(values)
    values.each_key { |attr| send("#{attr}=", values[attr]) }
  end
end

data = { name: 'PATAHA', pass: 'abc' }

a = Account.new
a.attributes = data
puts a.inspect

# Class Definition
# Using Struct class
class Child < Struct.new(:name, :age)
  def to_s
    "#{name} #{age}"
  end
end

c = Child.new('PATAHA')
c.age = 18
puts c

child_class = Class.new do
  def self.class_method
    puts 'here is class method'
  end

  def instance_method
    puts 'here is instance method'
  end
end

c = child_class.new
child_class.class_method
c.instance_method
