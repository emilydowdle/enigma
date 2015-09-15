class Key_Generator

  def initialize
  end

  def key
    key = []
    5.times do
      key << rand(0..9)
    end
    key
  end

end
