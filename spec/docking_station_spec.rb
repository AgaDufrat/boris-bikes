require 'boris_bikes'

describe DockingStation do
  let(:bike) { double(:bike) }
  it { should respond_to(:release_bike) }

  it 'gets a bike' do
    allow(bike).to receive(:working).and_return(true)
    subject.dock bike
    expect(subject.release_bike).to eq bike
  end

  it 'expects the bike to be working' do
    bike = double(:bike, :working => true)
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
    bike = double(:bike)
    subject.dock(bike)
    expect(subject.bikes).to include(bike)
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

    ds.dock(double(:bike, :working => false))
    expect { ds.release_bike}.to raise_error "no working bikes"
  end
  it "does not release a broken bike" do
    working_bike = double(:bike, :working => true)
    broken_bike = double(:broken_bike, :working => false)
    ds = DockingStation.new
    ds.dock(working_bike)
    ds.dock(broken_bike)
    expect {2.times { ds.release_bike.working }}.to raise_error("no working bikes")
  end

end

describe '#dock(bike)' do
  it 'raisers an error when there docking station is full' do
    bike = double(:bike)
    expect { (DockingStation::DEFAULT_CAPACITY+1).times {subject.dock(bike)}}.to raise_error "Station is full"
  end

  it 'can dock 20 bikes' do
    station = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times {station.dock(double(:bike))}
    expect(station.bikes.size).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  it 'can report if the bike is broken' do
    ds = DockingStation.new
    bike = double(:bike, :working => false)
    expect(ds.is_bike_broken?(bike)).to eq(false)
  end
end



end
