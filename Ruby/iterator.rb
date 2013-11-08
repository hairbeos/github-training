arr = [{name: 'name1', age: '10'}, {name: 'name2', age: '20'}]
for i in 0...arr.length
  puts "#{arr[i][:name]} #{arr[i][:age]}"
end

puts arr.map {|item| "#{item[:name]} #{item[:age]}"}
arr.each {|item| puts "#{item[:name]} #{item[:age]}"}

# define variables in block: square
square = 'asdasds'
sum = 0
[1, 2, 3, 4].each do |value; square|
  square = value * value
  sum += square
end
puts sum
puts square

def fibo(max)
  i1, i2 = 1, 1 # parallel assignment
  while i1 <= max
    yield i1
    i1, i2 = i2, i1 + i2
  end
end
fibo(1000){|f| print f, " "}

class Array
  def find
    each do |value|
      return value if yield(value)
    end
  end
end

puts [1, 3, 5, 6].find{|v| v*v >= 30}

# Enumerators
result = []
"cat".each_char.with_index{|item, index| result << [item, index]}
print result, "\n"

enum = "cat".enum_for(:each_char)
puts enum.next

enum = (1..10).enum_for(:each_slice, 2)
print enum.to_a, "\n"

triangular_numbers = Enumerator.new do |yielder|
  number = 0
  count = 1
  loop do
    number += count
    count += 1
    yielder.yield number
  end
end

p 10.times {triangular_numbers.next}

def infinite_select(enum, &block)
  Enumerator.new do |yielder|
    enum.each do |value|
      yielder.yield(value) if block.call(value)
    end
  end
end

p infinite_select(triangular_numbers) {|val| val % 10 == 0}.first(5)


# Lazy Enumerators
def Integer.all
  Enumerator.new do |yielder, n: 0|
    loop {yielder.yield(n += 1)}
  end.lazy
end

def even?(i)
  i % 2 == 0
end
p Integer
	.all
	.select {|i| i % 5 == 0}
	.select {|i| even?(i)}
	.first(10)

odd = -> n { n % 2 == 1}

p Integer
	.all
	.select(&odd)
	.first(10)

#Lambda method
sum = lambda {|x, y| x + y}
p sum.call(1, 2)
p sum.call 1, 2

sum = -> (x, y) {x + y}
p sum.call(1,2)