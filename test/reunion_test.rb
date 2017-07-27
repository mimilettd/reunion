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

    assert_equal 60, reunion.total_cost
  end

  def test_it_can_add_another_activity
    reunion = Reunion.new("Denver")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Jim", 20)
    activity_1.add_participant("Joe", 40)
    reunion.add_activity(activity_1)
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Jim", 60)
    activity_2.add_participant("John", 80)
    reunion.add_activity(activity_2)

    assert_equal 200, reunion.total_cost
  end
end
