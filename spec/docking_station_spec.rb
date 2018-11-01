require 'boris_bikes'

describe DockingStation do
  it { should respond_to(:release_bike) }

  it 'gets a bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'expects the bike to be working' do
    bike = Bike.new
    expect(bike.working).to eq true
  end

  it 'expects station works with dock' do
    expect(subject).to respond_to(:dock)
  end

  it "Capacity can be set on instantiation" do
    ds = DockingStation.new(10)
    ds_default = DockingStation.new
    expect(ds.capacity).to eq(10)
    expect(ds_default.capacity).to eq(20)

  end

  it 'expects bike to dock with DockingStation' do
    station = DockingStation.new
    bike = Bike.new
    station.dock(bike)
    expect(station.bikes).to include(bike)
  end
  it 'expects default capacity to equal 20' do
    expect(DockingStation::DEFAULT_CAPACITY).to eq(20)
  end

describe '#release_bike' do
  it 'raises an error when there is no bikes' do
    expect { subject.release_bike }.to raise_error "No bikes"
  end
  it "gives an error when all docked bikes are broken" do
    ds = DockingStation.new
    ds.dock(Bike.new,false)
    expect { ds.release_bike}.to raise_error "no working bikes"
  end
  it "does not release a broken bike" do
    working_bike = Bike.new
    broken_bike = Bike.new
    ds = DockingStation.new
    ds.dock(working_bike)
    ds.dock(broken_bike, false)
    expect {2.times { ds.release_bike.working }}.to raise_error("no working bikes")
  end

end

describe '#dock(bike)' do
  it 'raisers an error when there docking station is full' do
    bike = Bike.new
    expect { (DockingStation::DEFAULT_CAPACITY+1).times {subject.dock(bike)}}.to raise_error "Station is full"
  end

  it 'can dock 20 bikes' do
    station = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times {station.dock(Bike.new)}
    expect(station.bikes.size).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  it 'can report if the bike is broken' do
    ds = DockingStation.new
    bike = Bike.new
    ds.dock(bike,false)
    expect(bike.working).to_not eq(true)
  end
end



end
