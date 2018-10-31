class DockingStation
  attr_reader = @bike, @counter

  def initialize
    @counter = 0
  end

  def release_bike
    fail "No bikes" unless @bike
    @bike
  end

  def dock(bike)
    fail "Station is full" unless @counter == 0
    @bike = bike
    @counter += 1
    @bike
  end
end

class Bike
  attr_reader = @status, @bike

  def initialize()
  end

  def working?
    return 'working'
  end
end
