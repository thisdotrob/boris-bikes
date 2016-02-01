require 'docking_station'
require 'garage'
require 'van'
require 'bike'

describe 'Feature' do
  it 'feature test' do
    station1 = DockingStation.new
    station2 = DockingStation.new(capacity: 5)
    van = Van.new
    garage = Garage.new
    19.times { station1.dock_bike(Bike.new) }
    2.times { station2.dock_bike(station1.release_bike, true) }
    3.times { station2.dock_bike(station1.release_bike) }
    van.collect_broken_bikes(station2)
    van.fix_bikes(garage)
    van.deliver_working_bikes(station1)
    expect(station1.bikes.length).to eq(16)
    expect(station2.bikes.length).to eq(3)
  end
end
