require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end
  # attr_reader :bikes

  def release_bike
    raise 'shit there is no bike!' if empty?
    @bikes.pop
  end

  def dock(bike)
    raise 'docking station is full' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length == 20 ? true : false
  end

  def empty?
    @bikes.empty? ? true : false
  end

end
