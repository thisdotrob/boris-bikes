class DockingStation

  CAPACITY = 20

  def initialize(capacity = CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def bikes
    @bikes.dup
  end

  def dock_bike(bike)
    full? ? (raise 'Docking station full') : @bikes << bike
  end

  def release_bike
    working_bike || (raise 'No bikes available')
  end

  private

  def working_bike
    @bikes.select { |bike| bike.working? == true }
  end

  def full?
    @bikes.length == @capacity
  end

  def empty?
    @bikes.empty?
  end

end
