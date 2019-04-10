# a trip belongs to a listing and a guest

class Trip

  attr_accessor :guest, :listing

  @@all = []

  def initialize(listing, guest)
    @guest = guest
    @listing = listing
    @@all << self
  end

# returns an array of all trips
  def self.all
    @@all
  end


end
