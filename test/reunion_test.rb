require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def test_it_exists
    reunion = Reunion.new("Denver")
    assert_instance_of Reunion, reunion
  end

  def test_it_has_a_name
    reunion = Reunion.new("Denver")
    assert_equal "Denver", reunion.name
  end

  def test_it_initializes_with_no_activities
    reunion = Reunion.new("Denver")
    expected = []
    assert_equal expected, reunion.activities
  end

  def test_it_can_add_a_new_activity
    reunion = Reunion.new("Denver")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Jim", 20)
    activity_1.add_participant("Joe", 40)
    reunion.add_activity(activity_1)
    assert_instance_of Array, reunion.activities
    assert_equal 1, reunion.activities.count
  end

  def test_it_can_return_total_cost
    reunion = Reunion.new("Denver")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Jim", 20)
    activity_1.add_participant("Joe", 40)
    reunion.add_activity(activity_1)
    assert_equal 60, reunion.total_cost
  end

  def test_it_can_return_total_cost_if_another_activity_is_added
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

  def test_it_can_breakout_money
    reunion = Reunion.new("Denver")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Jim", 20)
    activity_1.add_participant("Joe", 40)
    reunion.add_activity(activity_1)
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Jim", 60)
    activity_2.add_participant("John", 80)
    reunion.add_activity(activity_2)
    expected = {"Jim"=> 20, "Joe"=> -10, "John"=> -10}
    assert_equal expected, reunion.breakout
  end
end
