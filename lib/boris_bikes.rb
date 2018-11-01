class DockingStation
  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "No bikes" if empty?
    @bikes.size.times {
      if @bikes[0].working == true
        return @bikes.shift
        break
      else @bikes.rotate
      end
    }
    fail "no working bikes" if @bikes.select { |bike| bike.working }.empty?
  end

  def dock(bike)
    fail "Station is full" if full?
    @bikes.push(bike)
  end

 def is_bike_broken?(bike)
    bike.working
 end
 
private
  def full?
    true if @bikes.size >= @capacity
  end

  def empty?
    true if @bikes.size == 0
  end
end

class Bike
  attr_reader  :status, :bike
  attr_accessor :working

  def initialize()
    @working = true
  end

end
