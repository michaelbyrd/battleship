def get_user_input
  gets.chomp
end
class HumanPlayer < Player
  attr_reader :ships
  def initialize(name = "Dave" )
    @ships = []
    @name = name
    @board = Board.new
  end

  def print_line(l)
    print "#{self.name}, where would you like to place a ship of length #{l}?\nAcross or Down?\n"
  end

  def place_ships(lengths)
    lengths.each do |l|
      print_line(l)
    end
  end
end
