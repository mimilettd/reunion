require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require 'pry'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new("Brunch")
    assert_instance_of Activity, activity
  end

  def test_it_can_take_a_name
    activity = Activity.new("Brunch")
    assert_equal "Brunch", activity.name
  end

  def test_it_starts_with_no_participants
    activity = Activity.new("Brunch")
    expected = {}
    assert_equal expected, activity.participants
  end

  def test_it_can_take_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)
    expected = {"Jim" => 20}
    assert_equal expected, activity.participants
  end

  def test_it_can_take_total_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)
    assert_equal 20, activity.total_cost
  end

  def test_it_can_add_another_participant
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)
    activity.add_participant("Joe", 40)
    expected = {"Jim" => 20, "Joe" => 40}
    assert_equal expected, activity.participants
  end

  def test_it_can_take_total_cost_again
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)
    activity.add_participant("Joe", 40)
    assert_equal 60, activity.total_cost
  end

  def test_it_can_split_total_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)
    activity.add_participant("Joe", 40)
    assert_equal 30, activity.split
  end

  def test_it_can_return_money_owed
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)
    activity.add_participant("Joe", 40)
    expected = {"Jim" => 10, "Joe" => -10}
    assert_equal expected, activity.owed
  end

end
