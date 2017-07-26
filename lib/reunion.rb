require_relative 'activity'
require 'pry'

class Reunion
  attr_reader :city,
              :activity_1
  def initialize(city)
    @city = city
  end

  def add_activity(activity)
    @activity_1 = Activity.new(activity)
  end

  def total_cost
    activity_1.total_cost
  end
end
