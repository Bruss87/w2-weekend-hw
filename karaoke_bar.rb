class Karaoke_bar

attr_reader :name, :till, :entry_fee

def initialize(name, till, entry_fee)
  @name = name
  @till = till
  @entry_fee = entry_fee
end

def till_increases(entry_fee)
  @till += entry_fee
end

# def guest_can_enter_and_pays_entry_fee(room, entry_fee, guest)
#     return if room.check_if_room_is_available
#     guest.guest_pays_for_entry(entry_fee)
#     till_increases(entry_fee)
#     room.check_in_guest_to_room(guest)
#     room.guest_list_check
# end

end
