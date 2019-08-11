require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke_bar')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestKaraoke_bar < Minitest::Test

  def setup
    @guest_1 = Guest.new('Hank', 'Brave new world', 25)
    @guest_2 = Guest.new('John', 'Run to the hills', 15)
    @guest_3 = Guest.new('Helen', 'World coming down ', 20)
    @room1 = Room.new(@guest_list, @playlist, 5)
    @karaoke_bar = Karaoke_bar.new('Old Barn', 150, 10)
end

def test_bar_has_name
  assert_equal("Old Barn", @karaoke_bar.name())
end

def test_bar_has_till
  assert_equal(150.00, @karaoke_bar.till())
end

def test_till_increases
  assert_equal(160, @karaoke_bar.till_increases(10))
end

def test_guest_can_enter_room_and_pays_entry_fee
  @room1.check_in_guest_to_room(@guest_3)
  @room1.check_in_guest_to_room(@guest_2)
  @room1.check_if_room_is_available
  @guest_1.guest_pays_for_entry(10)
  @room1.check_in_guest_to_room(@guest_1)
  assert_equal("You may enter, 10£ please.", @room1.check_if_room_is_available)
  assert_equal(15, @guest_1.wallet())
  assert_equal(160, @karaoke_bar.till_increases(10))
  assert_equal(3, @room1.guest_list_check)
end





end
