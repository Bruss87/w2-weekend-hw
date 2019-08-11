require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')

class TestGuest < Minitest::Test

def setup
  @guest_a = Guest.new('Kora','Schism', 25)
end

def test_has_name
  assert_equal('Kora', @guest_a.name())
end

def test_has_favourite_song
  assert_equal('Schism', @guest_a.favourite_song())
end

def test_has_money
  assert_equal(25, @guest_a.wallet())
end















end
