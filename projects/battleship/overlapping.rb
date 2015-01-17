ship = [1,2,3]
ship2 = [3,4,5]

ship.each do |coord|
  ship2.each do |coord2|
    puts 'we match' if coord == coord2
  end
end
