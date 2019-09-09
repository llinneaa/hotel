require 'date'

module Hotel
  class Reservation
    ROOM_RATE = 200
    attr_reader :room_number, :date_range

    def initialize(room_number:, date_range:)
      @room_number = room_number
      @date_range = date_range
    end

    def total_cost(nights)
      return (ROOM_RATE * nights)
    end
  end
end
