require_relative 'crack_code'

input_filename = ARGV[0]
output_filename = ARGV[1]
date = ARGV[2]

message = CrackCode.new
message.crack_runner(input_filename, output_filename, date)
