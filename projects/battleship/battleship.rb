class Battleship
end

class Ship
  attr_accessor :length, :x, :y, :across
  def initialize(length)
    @length = length
    @placed = false
  end

  def place(x, y, across)
    if @placed
      false
    else
      @x = x
      @y = y
      @across = across
      @placed = true
    end
  end

  def covers?(x,y)
    if @across
      if @y == y && (@x...@x+self.length).to_a.include?(x)
        true
      else
        false
      end
    else
      if @x == x && (@y...@y+self.length).to_a.include?(y)
        true
      else
        false
      end
    end
  end

end
