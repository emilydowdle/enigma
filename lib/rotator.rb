class Rotator

### we've got two strings coming in that we need to add: the key string and the date offset string

  CHAR_MAP = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]

  def initialize(string)
    @string = string
  end

  def string_to_array
    key_array = @string.chars
  end

end


PSEUDOCODE FOR Rotator

START

key string
break key string into an array (key array)

a

a rotation
  [b, c, d...]
b rotation
  [d, e, f, g]
c rotation

d rotation
