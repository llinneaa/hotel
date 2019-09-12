require 'date'

module Hotel
  class HotelBooker
    attr_reader :rooms
    attr_accessor :reservations

    def initialize(rooms:, reservations: [])
      @rooms = (1..20).to_a
      @reservations = [] || reservations
    end

    #selects first available room for reservation, shovels into reservations array
    #if there were no available rooms, the array would be empty! therefore, if the length of the array is 0, the program raises an ArgumentError.
    #instructor helped me fix this code and the test in our 1:1 (had been returning a Hash)
    def createReservation(room_number, date_range)
      available_rooms_list = rooms_available?(date_range)
      if available_rooms_list.length == 0
        raise ArgumentError.new("no available rooms for those dates!")
      end

      new_reservation = Reservation.new(room_number: available_rooms_list.first, date_range: date_range)
      return @reservations << new_reservation
    end

    #checks the date_range
    def reservationsByDate(date)
      @reservations.each do |reservation_object|
        if reservation_object.date_range.createDateArray.include?(date)
          return reservation_object
        end
      end
    end

    #first tried shoveling all room numbers EXCEPT those with overlapping date ranges into an empty array available_rooms, but program was returning nil values; .delete method worked (provide full array of rooms using @rooms instance variable, then delete as they appear to return an array with available dates)
    def rooms_available?(date_range)
      available_rooms = @rooms
      @reservations.each do |reservation_object|
        if reservation_object.date_range.overlap?(date_range) == true
          available_rooms.delete(reservation_object.room_number)
        end
      end
      return available_rooms
    end
  end
end