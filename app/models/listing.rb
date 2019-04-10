
# a listing (i.e. a house or apartment) has many trips

# a listing has a city attribute which is a string of a city name, e.g. 'Seattle'

class Listing

  attr_accessor :city, :name

  @@all = []

  def initialize(city, name)
    @city = city
    @name = name
    @@all << self
  end

 # guests returns an array of all guests who have stayed at a listing
  def guests
    all_guests = []
    Trip.all.each do |trip_object|
      if trip_object.listing == self
        all_guests << trip_object.guest
      end
    end
    all_guests
  end

# trips returns an array of all trips at a listing
  def trips
    Trip.all.select do |trip_object|
      trip_object.listing == self
    end
  end

# returns the number of trips that have been taken to that listing
  def trip_count
    self.trips.size
  end

# returns an array of all listings
  def self.all
    @@all
  end

 # takes an argument of a city name (as a string) and returns all the listings for that city
  def self.find_all_by_city(city)
    self.all.select do |listing_object|
      listing_object.city == city
    end
  end

# finds the listing that has had the most trips
  def self.most_popular
    trips_hash = Hash.new(0)
      Trip.all.each do |trip_object|
        trips_hash[trip_object.listing] += 1
      end
    sorted_trips = trips_hash.sort_by {|key, value| value}
    sorted_trips[-1]
  end


end
