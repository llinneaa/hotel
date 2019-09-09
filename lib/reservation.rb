module Hotel
  class Reservation
    ROOM_RATE = 200
    attr_reader :id, :room_number, :date_range

    def initialize(id:, room_number:, date_range:)
      @id = id.to_i
      @room_number = room_number
      @date_range = date_range
      #@rate = rate
    end

    def total_cost(nights)
      return (ROOM_RATE * nights)
    end

    def findAvailableRoom
    end
  end
end
