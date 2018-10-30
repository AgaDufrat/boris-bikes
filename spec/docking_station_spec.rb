require 'boris_bikes'

describe DockingStation do
  it { should respond_to(:release_bike) }

  it 'gets a bike' do
    station = DockingStation.new
    expect(station.release_bike).to be_an_instance_of(Bike)
  end

  it 'expects the bike to be working' do
    bike = Bike.new
    expect(bike.working?).to eq "working"
  end
end
