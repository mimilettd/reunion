require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_exist
    activity = Activity.new("Brunch")
    assert_instance_of Activity, activity
  end
end
