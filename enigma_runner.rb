require './lib/enigma'

input_filename = ARGV[0]
output_filename = ARGV[1]

chizzle_my_nizzle = Enigma.new
chizzle_my_nizzle.process(input_filename, output_filename)

puts "Done, party time!"
