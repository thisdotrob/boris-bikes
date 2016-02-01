require_relative 'bike'

class DockingStation
  CAPACITY = 20

  def initialize(args = {})
    @bikes = []
    @capacity = args[:capacity] || CAPACITY
    @bike_class = args[:bike_class] || Bike
  end

  def bikes
    working_bikes
  end

  def dock_bike(bike, reported_broken = false)
    raise 'Not a bike' unless bike.is_a?(@bike_class)
    raise 'Docking station full' if full?
    bike.break if reported_broken
    @bikes << bike
  end

  def release_bike(index = 0)
    @bikes.delete(working_bikes[index]) || (raise 'No working bikes available')
  end

  def release_broken_bikes
    broken_bikes = @bikes.reject { |bike| bike.working? } 
    raise 'No broken bikes available' if broken_bikes.empty?
    @bikes = @bikes - broken_bikes
    broken_bikes
  end

  private

  def working_bikes
    @bikes.dup.select { |bike| bike.working? }
  end

  def full?
    @bikes.length == @capacity
  end

end
