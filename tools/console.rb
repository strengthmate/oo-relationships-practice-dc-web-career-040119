require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

listing_A = Listing.new("Washington, DC", "Cool Crib")
listing_B = Listing.new("Baltimore, MD", "Awesome Attic")
listing_C = Listing.new("Las Vegas, NV", "Rad Pad")
listing_D = Listing.new("Santa Fe, NM", "Sweet Place")

guest_A = Guest.new("A")
guest_B = Guest.new("B")
guest_C = Guest.new("C")
guest_D = Guest.new("D")
guest_E = Guest.new("A")
guest_F = Guest.new("A")
guest_G = Guest.new("A")

trip_A = Trip.new(listing_A, guest_A)
trip_B = Trip.new(listing_B, guest_B)
trip_C = Trip.new(listing_C, guest_C)
trip_D = Trip.new(listing_D, guest_D)
trip_E = Trip.new(listing_C, guest_A)
trip_F = Trip.new(listing_C, guest_A)

# Guest.find_all_by_name("A")

Pry.start
