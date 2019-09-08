module Hotel
  class Reservation
    attr_reader :id, :room_number, :date_range, :rate
    #attr_accessor :cost

    def initialize(id:, room_number:, date_range:, rate: nil)
      @id = id
      @room_number = room_number
      @date_range = date_range
      @rate = rate
    end

    def total_cost(nights)
      return (@rate * nights)
    end
  end
end

# reservation id = generated
# room number
# check_in_date
# check_out_date