class DockingStation
  attr_reader = @bike_instance
  def release_bike
    Bike.new
  end

  def dock(bike)
    @bike_instance = []
    @bike_instance << bike
  end
end

class Bike
  attr_reader = @status

  def initialize()

  end

  def working?
    return 'working'
  end
end
