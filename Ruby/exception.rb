a, b = 1, 0
begin
  c = a/b
rescue ZeroDivisionError
  puts "Divided by zero"
  # raise
rescue Exception
  puts "Error when executing. Details: #{$!}"
end

begin
  f = File.open("data")
  while line = f.gets
    puts line
  end

rescue Exception => e
  puts e
  puts caller
  raise IOError, "FileNotFound", caller if f.nil?
ensure
  f.close unless f.nil?
  p "Finish read file"
end

# Catch and Throw
floor = [["blank", "blank", "blank"],
         ["gummy", "blank", "blank"],
         ["blank", "blank", "blank"]]

candy = nil
attempts = 0
floor.each do |row|
  row.each do |tile|
    attempts += 1
    candy = tile if tile == "gummy"
  end
end
puts candy
puts attempts

# Use catch
floor = [["blank", "blank", "blank"],
         ["gummy", "blank", "blank"],
         ["blank", "blank", "blank"]]

attempts = 0
candy = nil
catch(:found) do
  floor.each do |row|
    row.each do |tile|
      attempts += 1
      if tile == "gummy"
        candy = tile
        throw(:found)
      end
    end
  end
end
puts candy
puts attempts

attempts = 0
candy = catch(:found) do
  floor.each do |row|
    row.each do |tile|
      attempts += 1
      throw(:found, tile) if tile == "gummy"
    end
  end
end
puts candy
puts attempts