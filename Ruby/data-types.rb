Song = Struct.new(:title, :name, :length)

File.open("data") do |song_file|
  songs = []
  song_file.each.with_index do |line, index|
    file, length, name, title = line.chomp.split(/\s*\|\s*/)
    name.squeeze!(" ")
    mins, secs = length.scan(/\d+/)
    songs << Song.new(title, name, mins.to_i*60 + secs.to_i)
    puts songs[index]
  end
end

digits = 0..9
p digits.include?(5)
p digits.max
p digits.class.name

# Range sample
class PowerOfTwo
  attr_reader :value
  def initialize(value)
    @value = value
  end
  def <=> (other)
    @value <=> other.value
  end
  def succ
    PowerOfTwo.new(@value*2)
  end
  def to_s
    @value.to_s
  end
end

p1 = PowerOfTwo.new(4)
p2 = PowerOfTwo.new(32)

p p1, p2
puts (p1..p2).to_a

puts false.class.superclass
