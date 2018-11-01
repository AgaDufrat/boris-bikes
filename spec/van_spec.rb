require 'van'


describe Van do
  let(:bike) { double(:working=> true) }
  let(:broken_bike) { double(:working=> false) }
  let(:garage) {double(:store => true, :release_working_bike => bike)}
  let(:dockingstation) {double(:release_broken_bike => broken_bike)}

  it "takes broken bike and puts it in a van" do
    subject.get_broken_bikes(dockingstation)
    expect(subject.bikes.include?(broken_bike)).to eq true
  end

  it "van can drop off a bike at the garage" do
    subject.bikes << broken_bike
    subject.deliver_broken_bike(garage)
    expect(subject.bikes.empty?).to eq(true)
  end

  it "can pick up working bikes" do
    garage.store(bike)
    subject.collect_working_bike(garage)
    expect(subject.working_bikes.include?(bike)).to eq true
  end

  it "can drop off working bikes at docking stations" do
    subject.drop_working_bike(dockingstation)
    expect(van.bikes).to_not include(bike)
  end

  end
end
