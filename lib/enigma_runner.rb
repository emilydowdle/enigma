require './lib/enigma'

input_filename = ARGV[0]
output_filename = ARGV[1]
key = ARGV[2]
date = ARGV[3]

encrypt = Enigma.new
encrypt.process(input_filename, output_filename)

puts "Done, party time!"
