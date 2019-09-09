require_relative 'test_helper'
require 'rake'

describe "HotelBooker class" do
  before do
    @date_range = Hotel::DateRange.new("2001/2/3", "2001/2/5")
    @reservations = Hotel::Reservation.new(room_number: 1, date_range: @date_range)
    @hotel_booker = Hotel::HotelBooker.new(
      rooms: (1..20).to_a,
      reservations: @reservations)
  end
  describe "HotelBooker instantiation" do
    it "is an instance of HotelBooker" do
      expect(@hotel_booker).must_be_instance_of Hotel::HotelBooker
    end

    it "lists all rooms in the hotel" do
      expect(@hotel_booker.rooms.count).must_equal 20
    end
  
  describe "HotelBooker instantiation" do
    before do
      @hotel_reservation = @hotel_booker.createReservation(1, @date_range)
    end

    it "stores new reservations in the reservations array" do
      expect(@hotel_reservation).must_be_kind_of Array
      expect(@hotel_reservation[0]).must_be_instance_of Hotel::Reservation
    end

    it "selects all reservations on a specified date" do
      list_of_reservations = []
      list_of_reservations << @hotel_booker.reservationsByDate(Date.parse("2001/2/3"))

      expect(list_of_reservations).must_be_kind_of Array
      expect(list_of_reservations[0]).must_be_instance_of Hotel::Reservation
    end
  end
  end
end
