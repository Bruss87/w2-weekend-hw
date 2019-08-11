class Guest

attr_reader :name, :favourite_song, :wallet

def initialize(name, favourite_song, wallet)
@name = name
@favourite_song = favourite_song
@wallet = wallet
end

def guest_pays_for_entry(entry_fee)
  @wallet -= entry_fee
end

end
