require './player'
require './human_player'
require './computer_player'

class Board
  Y_COORDS = [ "A", "B", "C", "D", "E", "F", "G", "H", "I", "J" ]
  def initialize
    @ships = []
    @hits =[]
    @misses = []
  end

  def y_of(str)
    Y_COORDS.index(str[0]) + 1
  end

  def x_of(str)
    str[1..-1].to_i
  end

  def sunk?
    if @ships.empty?
      return false
    else
      @ships.all? do |ship|
        ship.sunk?
      end
    end
  end

  def has_ship_on?(x, y)
    @ships.any? do |ship|
      if ship.covers?(x, y)
        return ship
      end
    end
  end

  def fire_at(x, y)
    if has_ship_on?(x,y)
      @hits << [x,y]
      has_ship_on?(x,y).fire_at(x,y)
    end
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

  def display
    print_header
    print_rows
    print footer
  end

  def print_rows
    letters = ('A'..'J').to_a
    data = build_board
    data.length.times do |i|
      print_row(letters[i], data[i])
    end
  end

  def ship_coords
    tbr = []
    @ships.each do |s|
      s.coords_covered.each do |c|
        tbr << c
      end
    end
    tbr
  end

  ARRAY_OF_SPACES=[" ", " ", " ", " ", " ", " ", " ", " ", " ", " "]

  def super_grid
    grid = []
    10.times do
      grid << ARRAY_OF_SPACES.clone
    end
    grid
  end

  def build_board
    # grid = [[],[],[],[],[],[],[],[],[],[]]
    grid = super_grid
    ship_coords.each do |coord|
      grid[coord[1]-1][coord[0]-1] = 'O'
    end

    @hits.each do |hit|
      grid[hit[1]-1][hit[0]-1] = 'X'
    end
    # grid = fill_in_grid(grid)
    return grid
  end

  def fill_in_grid(grid)
    grid.each do |outer_array|
      outer_array.each do |box|
        if box.nil?
          box = ' '
        end
      end
    end
    return grid
  end

  def print_header
    print "    1   2   3   4   5   6   7   8   9   10\n"
    print "      -----------------------------------------\n"
  end


  def print_row(l, a)
    print "      #{l} | #{a[0]} | #{a[1]} | #{a[2]} | #{a[3]} | #{a[4]} | #{a[5]} | #{a[6]} | #{a[7]} | #{a[8]} | #{a[9]} |\n"
  end

  def footer
    print "      -----------------------------------------\n"
    print "    "
  end
end



