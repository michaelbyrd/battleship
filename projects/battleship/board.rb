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
    @ships.any? do |ship|
      ship.covers?(x_of(str), y_of(str))
    end
  end

  def fire_at(str)
    has_ship_on?(str)
  end

  def has_ship_coords?(x,y)
    @ships.any? do |ship|
      ship.covers?(x,y)
    end
  end

  def check_ship(ship, str, across)
    if across
      coords = (x_of(str)...x_of(str)+ship.length).to_a.map!{|x|[x,y_of(str)]}
    else
      coords = (y_of(str)...y_of(str)+ship.length).to_a.map!{|y|[x_of(str),y]}
    end
    coords.any? do |coord|
      has_ship_coords?(coord[0],coord[1])
    end
  end

  def place_ship(ship, str, across)
    unless check_ship(ship, str, across)
      ship.place(x_of(str),y_of(str),across)
      @ships << ship
    else
      false
    end
  end
end
