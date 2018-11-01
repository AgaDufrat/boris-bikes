require './lib/boris_bikes.rb'

station = DockingStation.new
20.times { station.dock(Bike.new) }
