require_relative 'test_helper'
require 'rake'

describe "HotelBooker class" do
  describe "HotelBooker instantiation" do
    before do
      @reservations = Hotel::Reservation.new(id: 1, room_number: 1, date_range: [2001-02-03, 2001-02-04])
      @hotel_booker = Hotel::HotelBooker.new(
        rooms: (1..20).to_a,
        reservations: @reservations)
    end

    it "is an instance of HotelBooker" do
      expect(@hotel_booker).must_be_instance_of Hotel::HotelBooker
    end

    it "lists all rooms in the hotel" do
      expect(@hotel_booker.rooms).must_equal [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    end

    # it "stores new reservations in the reservations array" do
    #   new_reservation = Hotel::Reservation.new(1, 1, [2001-02-03, 2001-02-04], 200)
    #   @reservations << new_reservation
    #   expect(@reservations).must_equal [{id: 1, room_number: 1, date_range: [2001-02-03, 2001-02-04], rate: 200]
    # end

  end
end
