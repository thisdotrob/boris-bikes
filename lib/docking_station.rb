require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end
  # attr_reader :bikes

  def release_bike
    raise 'shit there is no bike!' unless @bikes.length > 0
    @bikes.pop
  end

  def dock(bike)
    raise 'docking station is full' if @bikes.length == 20
    @bikes << bike
  end

end
