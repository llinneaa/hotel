module Hotel
  class HotelBooker
    attr_reader :rooms
    attr_accessor :reservations

    def initialize(rooms: [], reservations: [])
      # res an array or hash with ID as key?
      # can I make an entire instance (of reservation) into a hash and store it in the reservations array?
      @rooms = (1..20).to_a
      @reservations = [] || reservations
    end

    def createReservation
      new_reservation = Reservation.new(id, room_number, date_range)
      puts new_reservation
      return @reservations << new_reservation
    end

    # def newReservation()
    #   new_room = find_room
      
    #   available_driver = drivers.find { |driver| driver.status == :AVAILABLE }

    #   if available_driver == nil
    #     raise ArgumentError.new("No available drivers")
    #   end

    #   new_reservation = Hotel::Reservation.new(
    #     id: reservations.length + 1,
    #     passenger: passenger_for_ride,
    #     driver: available_driver,
    #     start_time: Time.now.to_s,
    #     end_time: nil,
    #     cost: nil,
    #     rating: nil
    #   )

    #   passenger_for_ride.add_trip(new_trip)
    #   available_driver.add_new_trip(new_trip) #helper method
    #   @reservations << new_reservation
    #   return new_trip
    # end

    # def available?
    #   if @rooms.include?(new_reservation.room_number)
    #     raise ArgumentError.new("this room is unavailable")
    #   end
    # end

  end
end

#purpose of the hotel manager is to hold reservation instances (and maybe room instances?) and access them