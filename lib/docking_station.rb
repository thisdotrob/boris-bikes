require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  attr_reader :bikes

  def dock(bike)
    raise 'docking station is full' if full?
    @bikes << bike
  end

  def release_bike
    raise 'No bikes in docking station' if empty?
    bikes.length.times do
      bike = @bikes.pop
      if bike.working
        return bike
      else
        @bikes.unshift bike
      end
    end
    raise 'no working bikes available'
  end

  private

  def full?
    @bikes.length == @capacity ? true : false
  end

  def empty?
    @bikes.empty? ? true : false
  end

end
