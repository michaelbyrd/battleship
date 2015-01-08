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

  def has_ship_on?(x, y)
    @ships.any? do |ship|
      ship.covers?(x, y)
    end
  end

  def fire_at(x, y)
    has_ship_on?(x, y)
  end

  def check_ship(ship, x, y, across)
    if across
      coords = (x...x+ship.length).to_a.map!{|xx|[xx,y]}
    else
      coords = (y...y+ship.length).to_a.map!{|yy|[x,yy]}
    end
    coords.any? do |coord|
      has_ship_on?(coord[0],coord[1])
    end
  end

  def place_ship(ship, x, y, across)
    unless check_ship(ship, x, y, across)
      ship.place(x, y, across)
      @ships << ship
    else
      false
    end
  end
end
