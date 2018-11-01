class Garage
  attr_reader :bikes
  def initialize
    @bikes = []
  end
  def store(bike)
    bikes.push(bike)
  end
end
