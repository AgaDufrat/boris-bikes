class Van
  attr_accessor :bikes, :working_bikes
  def initialize
    @bikes = []
    @working_bikes = []
  end
  def get_broken_bikes(ds)
      @bikes << ds.release_broken_bike
  end
  def deliver_broken_bike(garage)
    garage.store(@bikes.pop)
  end
  def collect_working_bike(garage)
    @working_bikes << garage.release_working_bike
  end
end
