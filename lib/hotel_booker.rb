module Hotel
  class HotelBooker
    def initialize(rooms: [], reservations: [])
      @rooms = (1..20).to_a
      @reservations = reservations
    end

    def createReservation
      new_reservation = Reservation.new(id, room_number, date_range, rate)
      @reservations << new_reservation
    end

    # def available?
    #   if @rooms.include?(new_reservation.room_number)
    #     raise ArgumentError.new("this room is unavailable")
    #   end
    # end

  end
end

#purpose of the hotel manager is to hold reservation instances (and maybe room instances?) and access them