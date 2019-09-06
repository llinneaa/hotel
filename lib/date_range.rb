require 'date'

module Hotel
  class DateRange
    attr_reader :start_date, :end_date, :duration, :date_range

    def initialize(start_date:, end_date:, duration: nil, date_range: [])
      @start_date = Date.parse(start_date)
      @end_date = Date.parse(end_date)
      overlap?(@start_date, @end_date)
      @duration = duration(@start_date, @end_date)
      @date_range = [] || createDateArray(@start_date, @end_date)
    end

    def duration(start_date, end_date)
      duration = (@end_date - @start_date).to_i
      return duration
    end

    def overlap?(start_date, end_date)
      if @end_date < @start_date || @end_date == @start_date
        raise ArgumentError.new("the end date is before the start date!")
      end
    end

    def createDateArray(start_date, end_date)
      counter = 0
      dates_array = []
      until (@start_date + counter) == (@end_date + 1)
        dates_array << (@start_date + counter)
        counter += 1
      end
      return dates_array
    end
  end
end

#move start date, end date, and duration to reservation class, then call overlap from that class?

#start, end dates... duration
#check each room and the date range; if any overlap, return false


