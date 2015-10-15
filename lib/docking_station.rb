require_relative 'bike'

class DockingStation

  attr_reader :bike

  def release_bike
    raise 'shit there is no bike!' unless @bike
    @bike
  end

  def dock(bike)
    raise 'docking station is full' if @bike
    @bike = bike #docking the argument of dock method into slot
  end

end
