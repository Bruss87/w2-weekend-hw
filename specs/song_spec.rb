require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class TestSong < Minitest::Test

def setup
  @song1 = Song.new('Fear Innoculum')
end

def test_has_name
  assert_equal('Fear Innoculum', @song1.name())
end



end
