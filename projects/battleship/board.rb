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
    @ships.each do |ship|
      ship.covers?(x_of(str), y_of(str))
    end
  end

  def place_ship(ship, str, across)
    ship.place(x_of(str),y_of(str),across)
    @ships << ship
  end
end
