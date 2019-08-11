class Room

  attr_accessor :guest_list, :playlist, :capacity

  def initialize(guest_list, playlist, capacity)
    @guest_list = []
    @playlist = []
    @capacity = capacity
  end

  def guest_list_check
    return @guest_list.count()
  end

  def check_in_guest_to_room(guest)
    @guest_list << guest
  end

  def check_out_guest_from_room(guest)
    @guest_list.delete(guest)
  end

  def playlist_check
    return @playlist.count()
  end

  def add_song_to_room_playlist(song)
    @playlist << song
  end

  def check_the_title_of_the_song(song)
    return song.name
  end

  def remove_song_from_room_playlist(song)
    @playlist.delete(song)
  end

  def check_if_room_is_available
    if @guest_list.count < @capacity
      return "You may enter, 10£ please."
    else "Sorry, room is full"
    end
  end

  def if_favourite_song_is_on_the_playlist(guest)
    @playlist.find {
      |song| song.name == guest.favourite_song
      return "youhooo!"
    }
  end


end
