require 'garage'

describe Garage do
    let(:bike) { double(:working=> true) }
    let(:broken_bike) { double(:working=> false) }
    let(:van) {double(:get_broken_bikes => true, deliver_broken_bike => true)}
    let(:dockingstation) {double(:release_broken_bike => broken_bike)}

it 'can store broken bikes' do
  subject.store(broken_bike)
  expect(subject.bikes).to include(broken_bike)
end


end
