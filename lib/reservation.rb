module Hotel
  class Reservation
    ROOM_RATE = 200
    attr_reader :id, :room_number, :date_range, :rate

    def initialize(id:, room_number:, date_range:, rate: 200)
      @id = id.to_i
      @room_number = room_number
      @date_range = date_range
      @rate = rate
    end

    def total_cost(nights)
      return (@rate * nights)
    end

    # def findAvailableRoom
    # end
  end
end

# room number
# check_in_date
# check_out_date