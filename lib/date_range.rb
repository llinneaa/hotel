require 'date'

module Hotel
  class DateRange
    attr_reader :start_date, :end_date

    def initialize(start_date:, end_date:, date_range: [])
      @start_date = Date.parse(start_date)
      @end_date = Date.parse(end_date)
      if @end_date <= @start_date
        raise ArgumentError.new("the end date is before the start date!")
      end
    end

    #do not want to include end date because another reservation CAN include that same date (as the start date)
    def createDateArray(input_start_date, input_end_date)
      return (input_start_date...input_end_date).to_a
      #return (@start_date...@end_date).to_a
    end

    def duration
      return (@end_date - @start_date).to_i
    end

    def includesDate?(date)
      if createDateArray.include?(date)
        return reservation_id
      end
    end

    def overlap?(start_date, end_date)
      #some new overlap method
      #does this require iteration?
      #check each room and the date range; if any overlap, return false
    end
  end
end

