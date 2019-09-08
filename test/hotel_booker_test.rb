require_relative 'test_helper'
require 'rake'

describe "HotelBooker class" do
  describe "HotelBooker instantiation" do
    before do
      @reservations
      @hotel_booker = Hotel::HotelBooker.new(
        rooms: (1..20).to_a,
        reservations: [])
    end

    it "is an instance of HotelBooker" do
      expect(@hotel_booker).must_be_kind_of Hotel::HotelBooker
    end

    it "lists all rooms in the hotel" do
      expect(@hotel_booker.rooms).must_equal [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    end

    # it "stores new reservations in the reservations array" do
    #   new_reservation = Hotel::Reservation.new(id, room_number, date_range, rate)
    #   @reservations << new_reservation
    #   expect(@reservations).must_equal [{id: 1, room_number: 1, date_range: }]
    # end

  end
end
