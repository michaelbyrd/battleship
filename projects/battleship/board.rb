class Board
  Y_COORDS = [ "A", "B", "C", "D", "E", "F", "G", "H", "I", "J" ]
  def initialize
    @ships = []
  end

  def y_of(str)
    Y_COORDS.index(str[0]) + 1
  end

  def x_of(str)
    str[1..-1].to_i
  end

  def has_ship_on?(str)
    if @ships == []
      false
    else
      @ships.any? do |ship|
        ship.covers?(x_of(str), y_of(str))
      end
    end
  end

  def place_ship(ship, str, across)
    unless has_ship_on?(str)
      ship.place(x_of(str),y_of(str),across)
      @ships << ship
    else
      false
    end
  end
end
