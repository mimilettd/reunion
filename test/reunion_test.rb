require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def test_it_exist
    reunion = Reunion.new("Denver")
    assert_instance_of Reunion, reunion
  end
end
