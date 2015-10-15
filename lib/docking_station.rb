require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  attr_reader :bikes

  def release_bike
    raise 'shit there is no bike!' if empty?
    bike = @bikes.pop
    raise 'cannot release broken bike' unless bike.working



  end

  def dock(bike, working=true)
    raise 'docking station is full' if full?
    bike.working = false if !working
    @bikes << bike

  end

  private

  def full?
    @bikes.length == DEFAULT_CAPACITY ? true : false
  end

  def empty?
    @bikes.empty? ? true : false
  end

end
