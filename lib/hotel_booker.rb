require 'date'

module Hotel
  class HotelBooker
    attr_reader :rooms
    attr_accessor :reservations

    def initialize(rooms:, reservations: [])
      @rooms = (1..20).to_a
      @reservations = [] || reservations
    end

    def createReservation(room_number, date_range)
      new_reservation = Reservation.new(room_number: room_number, date_range: date_range)
      return @reservations << new_reservation
    end

    def reservationsByDate(date)
      @reservations.each do |reservation_object|
        if reservation_object.date_range.createDateArray.include?(date)
          return reservation_object
        end
      end
    end
  end
end

#purpose of the hotel manager is to hold reservation instances (and maybe room instances?) and access them