# Open and Read file
File.open("wordlist", "r") do |file|
  file.each do |line|
    puts line
  end
end

File.open("wordlist", "r") do |file|
  file.each_line do |line|
    puts line
  end
end

File.open("wordlist", "r") do |file|
  while line = file.gets
    puts line
  end
end

File.open("wordlist", "r") do |file|
  file.each_byte.with_index do |ch, index|
    puts ch.chr
  end
end

IO.foreach('wordlist') {|line| puts line}

# Open and Writing to files
File.open('wordlist', 'w') do |file|
  file.puts 'pataha'
  file << 'chido'
end
puts File.read('wordlist')
STDOUT << File.read('wordlist')

require 'stringio'
ip = StringIO.new("now is\nthe time\n")
op = StringIO.new("", "w")

ip.each_line {|line| op.puts line.reverse}
STDOUT << op.string

# Taking to Networks
# Low-Level
require 'net/http'
http = Net::HTTP.new('vnexpress.net', 80)
response = http.get('/')
puts response.message
if response.message == "OK"
  puts response.body.scan(/<img alt=".*?" src="(.*?)"/m)
end

# High-Level
require 'open-uri'
open('https://google.com.vn') do |f|
  puts f.read.scan(/<a href=".*?"/m)
end

# Parsing HTML
require 'open-uri'
require 'nokogiri'
doc = Nokogiri::HTML(open('https://google.com.vn'))
puts doc.css("a")