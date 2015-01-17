require './ship'
require './board'



board = Board.new
board.place_ship(Ship.new(2), 3, 6, true)
board.place_ship(Ship.new(3), 7, 4, true)
board.place_ship(Ship.new(3), 4, 8, true)
board.place_ship(Ship.new(4), 1, 1, true)
board.place_ship(Ship.new(5), 6, 2, false)
board.display

