require 'date'

module Hotel
  class HotelBooker
    attr_reader :rooms
    attr_accessor :reservations

    def initialize(rooms:, reservations: [])
      @rooms = (1..20).to_a
      @reservations = [] || reservations
    end

    #Error says cannot call createDateArray method on a Hash, but I don't create a hash anywhere in code - look into this
    #selects first available room for reservation, shovels into reservations array
    def createReservation(room_number, date_range)
      available_rooms_list = rooms_available?(date_range: date_range)
      if available_rooms_list.length == 0
        raise ArgumentError.new("no available rooms for those dates!")
      end

      new_reservation = Reservation.new(room_number: available_rooms_list.first, date_range: date_range)
      return @reservations << new_reservation
    end

    def reservationsByDate(date)
      @reservations.each do |reservation_object|
        if reservation_object.date_range.createDateArray.include?(date)
          return reservation_object
        end
      end
    end

    #first tried shoveling all items except those with overlapping date ranges into an empty array but program was returning nil values; .delete method worked
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