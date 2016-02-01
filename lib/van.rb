class Van
  def initialize
    @broken_bikes = []
    @working_bikes = []
  end

  def collect_broken_bikes(station)
    @broken_bikes.push(*station.release_broken_bikes)
  end

  def deliver_working_bikes(station)
    station.dock_bike(@working_bikes.pop) until @working_bikes.empty?
  end

  def fix_bikes(garage)
    @working_bikes.push(*garage.fix_bikes(@broken_bikes))
  end

end
