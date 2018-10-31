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
    expect(bike.working?).to eq "working"
  end

  it 'expects station works with dock' do
    expect(subject).to respond_to(:dock)
  end

  it 'expects bike to dock with DockingStation' do
    station = DockingStation.new
    bike = Bike.new
    expect(station.dock(bike)).to eq(bike)
  end

describe '#release_bike' do
  it 'raisers an error when there is no bikes' do
    expect { subject.release_bike }.to raise_error "No bikes"
  end
end
end
