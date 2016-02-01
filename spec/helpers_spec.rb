module Helpers

  def dock_bike
    subject.dock_bike(bike)
  end

  def dock_two_bikes
    dock_bike
    subject.dock_bike(bike2)
  end

  def fix_bikes
    subject.fix_bikes([bike, bike, bike])
  end

  def release_broken
    subject.release_broken_bikes
  end
end
