require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < Minitest::Test

  def setup
    @guest1 = Guest.new('Mike', 'Grudge', 30)
    @guest2 = Guest.new('Nina', 'Lateralus', 20)
    @guest3 = Guest.new('Kristina', 'The Pot', 45)
    @song1 = Song.new('Lateralus')
    @song2 = Song.new('Grudge')
    @song3 = Song.new('Umbrella')
    @room1 = Room.new(@guest_list, @playlist, 5)
  end

  def test_guest_list_starts_at_zero
    assert_equal(0, @room1.guest_list_check())
  end

  def test_add_guest_to_guest_list
    @room1.check_in_guest_to_room(@guest3)
    assert_equal(1, @room1.guest_list_check)
  end

  def test_remove_guest_from_room
    @room1.check_in_guest_to_room(@guest3)
    @room1.check_in_guest_to_room(@guest2)
    @room1.check_out_guest_from_room(@guest2)
    assert_equal(1, @room1.guest_list_check)
  end

  def test_playlist_starts_at_zero
    assert_equal(0, @room1.playlist_check())
  end

  def test_add_song_to_playlist
    @room1.add_song_to_room_playlist(@song3)
    assert_equal(1, @room1.playlist_check)
  end

  def test_check_the_title_of_the_song
    assert_equal("Grudge", @song2.name)
  end

  def test_remove_song_from_playlist
    @room1.add_song_to_room_playlist(@song3)
    @room1.add_song_to_room_playlist(@song2)
    @room1.remove_song_from_room_playlist(@song3)
    assert_equal(1, @room1.playlist_check)
  end

  def test_check_room_capacity
    assert_equal(5, @room1.capacity())
  end

  def test_if_guest_can_enter_room
    @room1.check_in_guest_to_room(@guest3)
    @room1.check_in_guest_to_room(@guest2)
    assert_equal("You may enter, 10£ please.", @room1.check_if_room_is_available)
  end

  def test_when_room_is_full
    @room1.check_in_guest_to_room(@guest3)
    @room1.check_in_guest_to_room(@guest2)
    @room1.check_in_guest_to_room(@guest1)
    @room1.check_in_guest_to_room(@guest2)
    @room1.check_in_guest_to_room(@guest1)
    assert_equal("Sorry, room is full", @room1.check_if_room_is_available)
  end

  def test_if_favourite_song_is_on_the_playlist
    @room1.add_song_to_room_playlist(@song3)
    @room1.add_song_to_room_playlist(@song2)
    @room1.add_song_to_room_playlist(@song1)
    result =  @room1.if_favourite_song_is_on_the_playlist(@guest2)
    assert_equal("youhooo!", result)
  end





end
