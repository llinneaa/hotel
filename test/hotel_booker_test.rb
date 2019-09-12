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
  end
  
  #added @reservations.room_number parameter to try to debug the Hash error when raising an ArgumentError when all rooms are taken for a range range; might delete
  #deleted before/do statement which contained @hotel_reservation = @hotel_booker.createReservation(@reservations.room_number, @date_range); it was causing errors
  describe "HotelBooker methods" do
    it "stores new reservations in the reservations array" do
      @hotel_reservation = @hotel_booker.createReservation(@reservations.room_number, @date_range)
      expect(@hotel_reservation).must_be_kind_of Array
      expect(@hotel_reservation[0]).must_be_instance_of Hotel::Reservation
    end

    #shovels the reservations for a specified date into an array
    it "selects all reservations on a specified date" do
      @hotel_reservation = @hotel_booker.createReservation(@reservations.room_number, @date_range)
      list_of_reservations = []
      list_of_reservations << @hotel_booker.reservationsByDate(Date.parse("2001/2/3"))

      expect(list_of_reservations).must_be_kind_of Array
      expect(list_of_reservations[0]).must_be_instance_of Hotel::Reservation
    end

    #code finds the first available room, so the array will equal the remaining rooms 2-20
    it "can view a list of rooms that are not reserved for a given date range" do
      @hotel_reservation = @hotel_booker.createReservation(@reservations.room_number, @date_range)

      dates = Hotel::DateRange.new("2001/2/3", "2001/2/5")

      reservation = Hotel::Reservation.new(room_number: 1, date_range: dates)

      expect(@hotel_booker.rooms_available?(dates)).must_equal (2..20).to_a
    end

    #loops 20 times to create 20 different reservations to book all rooms; raises ArgumentError because no rooms available
    it "raises an exception if program tries to reserve a room during a date range when all rooms are reserved" do
      #room_number = 1
      20.times do
        @hotel_booker.createReservation(@reservations.room_number, @date_range)
        #room_number += 1
      end  
      expect{@hotel_booker.createReservation(@reservations.room_number, @date_range)}.must_raise ArgumentError
    end
  end
end
