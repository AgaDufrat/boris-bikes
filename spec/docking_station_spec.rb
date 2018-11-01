require 'boris_bikes'

describe DockingStation do
  let(:bike) { double(:working=> true) }
  let(:broken_bike) { double(:working=> false) }

  it { should respond_to(:release_bike) }

  it 'gets a bike' do
    subject.dock bike
    expect(subject.release_bike).to eq bike
  end

  it { expect(bike.working).to eq true }

  it {expect(subject).to respond_to(:dock) }

  it "Capacity can be set on instantiation" do
    ds = DockingStation.new(10)
    expect(ds.capacity).to eq(10)
  end

  it 'expects bike to dock with DockingStation' do
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
    subject.dock(broken_bike)
    expect { subject.release_bike}.to raise_error "no working bikes"
  end
  it "does not release a broken bike" do
    subject.dock(bike)
    subject.dock(broken_bike)
    expect {2.times { subject.release_bike.working }}.to raise_error("no working bikes")
  end

end

describe '#dock(bike)' do
  it 'raisers an error when there docking station is full' do
    expect { (DockingStation::DEFAULT_CAPACITY+1).times {subject.dock(bike)}}.to raise_error "Station is full"
  end

  it 'can dock 20 bikes' do
    DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}
    expect(subject.bikes.size).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  it 'can report if the bike is broken' do
    expect(subject.is_bike_broken?(broken_bike)).to eq(false)
  end
end

end
