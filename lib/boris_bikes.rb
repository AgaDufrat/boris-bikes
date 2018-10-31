class DockingStation
  attr_reader = @bike
  def release_bike
    fail "No bikes" unless @bike
    @bike
  end

  def dock(bike)
    @bike = bike
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
