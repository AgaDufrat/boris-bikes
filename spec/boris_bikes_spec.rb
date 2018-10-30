require 'boris_bikes'

describe DockingStation do
  it 'responds to message to release_bike' do
    docking_station = DockingStation.new

    expect(docking_station).to respond_to(:release_bike)
  end


end
