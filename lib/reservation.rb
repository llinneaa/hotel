module Hotel
  class Reservation
    attr_reader :reservation_id, :room_number, :start_date, :end_date, :cost

    def initialize(reservation_id:, room_number:, cost: nil)
      @reservation_id = reservation_id
      @room_number = room_number

      # if end_date != nil || start_date != nil
      #   if @end_date < @start_date
      #     raise ArgumentError.new("the end date is before the start date...")
      #   end
      # end

      @cost = cost
    end
  end
end

# reservation id = generated
# room number
# check_in_date
# check_out_date