# Fibers
words = Fiber.new do
  File.foreach("wordlist") do |line|
    line.scan(/\w+/) do |word|
      Fiber.yield(word)
    end
  end
endÇÇ

counts = Hash.new(0)
while word = words.resume
  counts[word] += 1
end

counts.keys.sort.each{|k| print "#{k}: #{counts[k]}\n"}

# Generate sequences using Fibers
seq = Fiber.new do
  num = 2
  loop do
    Fiber.yield(num) unless num % 3 == 0
    num += 2
  end
end

10.times {print seq.resume, " "}

# Threading
require 'net/http'
pages = %w(google.com.vn vnexpress.net dantri.com.vn)

threads = pages.map do |page|
  Thread.new(page) do |url|
    http = Net::HTTP.new(url, 80)
    print "Fetching: #{url}\n"
    print "#{Thread.current}\n"
    res = http.get('/')
    print "Got #{url}: #{res.message}\n"
  end
end

threads.each{|t| t.join}

# Threading, modify shared variables. Run wrong
sum = 0
threads = 10.times.map do
  Thread.new do
    100_000.times do
      new_value = sum + 1
      print "#{new_value}\t" if new_value % 250_000 == 0
      sum = new_value
    end
  end
end
threads.each(&:join)
puts "\nsum = #{sum}"

# Threading, using Mutex
sum = 0
mutex = Mutex.new
threads = 10.times.map do
  Thread.new do
    100_000.times do
      mutex.lock
      new_value = sum + 1
      print "#{new_value}\t" if new_value % 250_000 == 0
      sum = new_value
      mutex.unlock
    end
  end
end
threads.each(&:join)
puts "\nsum = #{sum}"

# Threading, syncronize
sum = 0
mutex = Mutex.new
threads = 10.times.map do
  Thread.new do
    100_000.times do
      mutex.synchronize do
        new_value = sum + 1
        print "#{new_value}\t" if new_value % 250_000 == 0
        sum = new_value
      end
    end
  end
end
threads.each{|t| t.join}
puts "\nsum = #{sum}"

puts system('date')
# puts `date`

#Running multiple Processes
pig = IO.popen("date", "w+")
# pig.puts "puts 'hello'"
# pig.close_write
puts pig.gets

# Independent Children
# exec("sort wordlist > output.txt") if fork.nil?
# Process.wait
trap("SIGCLD") do
	pid = Process.wait
	puts "Child pid #{pid}: terminated"
end
fork {exec("sort wordlist > output.txt")}