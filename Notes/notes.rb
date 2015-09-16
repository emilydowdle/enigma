message = "hello"
arr = message.chars

char_map = ["a", "b", "c", "d", "e"]

arr.each_with_index do |letter, index|
  if arr[0]
    letter = arr[index + 34]
  end
end

START

assume a rotation is 1
b rotation is 2
c rotation is 3
d rotation is 4

split string into array

set letter to h

set rotation to a

which letter in character map? h converts to i

set letter to e

rotation to b

b becomes d

set letter to l
 rotation to c

 l becomes o

 set letter to l
 rotation to d

 l becomes p

 set letter to o
 rotation to a

 o becomes p

find index of a, b, c, or d
find letter located at index + rotation

string = ["h", "e"]
rotations = [1, 2, 3, 4]
counter = 0
encrypted = []
char_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]


string.each_with_index do |letter, index|
  location = char_map.index(letter)
  encrypted << char_map[location + rotations[counter]]
  counter = (counter + 1) % rotations.length
end
