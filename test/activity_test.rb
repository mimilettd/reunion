require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_exist
    activity = Activity.new("Brunch")
    assert_instance_of Activity, activity
  end

  def test_it_has_a_name
    activity = Activity.new("Brunch")
    assert_equal "Brunch", activity.name
  end

  def test_it_can_take_participants
    activity = Activity.new("Brunch")
    expected = {}
    assert_equal expected, activity.participants
  end

  def test_it_can_add_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)
    expected = {"Jim" => 20}

    assert_equal expected, activity.participants
  end

  def test_it_can_take_total_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)
    activity.add_participant("Joe", 40)
    assert_equal 60, activity.total_cost
  end


end
