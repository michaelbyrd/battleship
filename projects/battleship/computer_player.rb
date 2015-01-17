class ComputerPlayer < Player
  attr_reader :name, :ships
  def initialize
    @name = "HAL 9000"
    @board = Board.new
    @ships = []
  end

  def place_ships(lengths)
    lengths.each do |l|
      @ships << Ship.new(l)
    end
    print "#{self.name} has placed his ships.\n"
    return true
  end
end
