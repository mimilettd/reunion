require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require 'pry'

class ReunionTest < Minitest::Test
  def test_it_exist
    reunion = Reunion.new("Denver")
    assert_instance_of Reunion, reunion
  end

  def test_it_can_sum_reunion_total_cost
    reunion = Reunion.new("Denver")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Jim", 20)
    activity_1.add_participant("Joe", 40)
    reunion.add_activity(activity_1)
    binding.pry

    assert_equal 60, reunion.total_cost
  end
end
