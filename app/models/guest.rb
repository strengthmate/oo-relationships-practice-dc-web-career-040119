require 'pry'
# a guest has many trips

class Guest

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

 # returns an array of all listings a guest has stayed at
  def listings
    all_guest_listings = []
    Trip.all.select do |trip_object|
      if trip_object.guest == self
        all_guest_listings << trip_object.listing
      end
    end
    all_guest_listings
  end

 # returns an array of all trips a guest has made
  def trips
    Trip.all.select do |trip_object|
      trip_object.guest == self
    end
  end

# returns the number of trips a guest has taken
  def trip_count
    all_guest_trips = Trip.all.select do |trip_object|
      trip_object.guest == self
    end
    all_guest_trips.size
  end

# returns an array of all guests
  def self.all
    @@all
  end

#returns an array of all guests who have made over 1 trip
  def self.pro_traveller
    pro_travellers = []
    guest_hash = Hash.new(0)
    Trip.all.each do |trip_object|
      guest_hash[trip_object.guest] += 1
    end
    guest_hash.each do |guest_name, num_trips|
      if num_trips > 1
        pro_travellers << guest_name
      end
    end
    pro_travellers
  end

#takes an argument of a name (as a string), returns the all guests with that name
  def self.find_all_by_name(name_input)

    self.all.select do |guest_object|
      guest_object.name == name_input
    end

    # arr = []
    # self.all.each do |guest_object|
    #   if guest_object.name == name_input
    #     arr << guest_object
    #   end
    # end
    # arr.each do |obj|
    #   puts obj
    # end ## why is this returning an array in pry mode?

  end


end
