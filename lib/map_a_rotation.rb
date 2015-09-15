class Map_A_Rotation

  attr_accessor :char_map,
                :leftovers
                :temp

  def initialize(offset)
    @offset = offset
  end

  def create_map
    prep
    encryption_map
  end

  def prep
    @char_map = []
    @leftovers = []
    @temp = []
  end

  def encryption_map
    CHAR_MAP.each_with_index do |letter, index|
      @temp << CHAR_MAP[index + @offset]
      if !@temp.include? letter
        @leftovers << letter
      end
      @temp.delete(nil)
      encryption_map = @temp + @leftovers
    end
  end

end
