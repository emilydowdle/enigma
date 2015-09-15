require './lib/enigma'

input_filename = ARGV[0]
output_filename = ARGV[1]

puzzle = Enigma.new
puzzle.process(input_filename, output_filename)

puts "Done, party time!"
