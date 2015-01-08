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

  def coords_covered
    if @across
      (@x...@x+self.length).to_a.map!{|x| [x,@y]}
    else
      (@y...@y+self.length).to_a.map!{|y| [@x,y]}
    end
  end

  def covers?(x,y)
    coords_covered.include?([x,y])
  end

  def overlaps_with?(ship)
   if coords_covered & ship.coords_covered == []
     false
   else
     true
   end
  end
end
