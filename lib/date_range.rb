require 'date'

module Hotel
  class DateRange
    attr_reader :start_date, :end_date

    #why did I have to make these arguments 'required' in order for my tests to work? 
    def initialize(input_start_date, input_end_date)
      @start_date = Date.parse(input_start_date)
      @end_date = Date.parse(input_end_date)
      if @end_date <= @start_date
        raise ArgumentError.new("the end date is before the start date!")
      end
    end

    #do not include end date in range because another reservation can include that same date as the start date
    def createDateArray
      @date_array = (@start_date...@end_date).to_a
      return @date_array
    end

    def duration
      duration = (@end_date - @start_date).to_i
      return duration
    end

    def overlap?(input)
      if self.createDateArray & input.createDateArray != []
        return true
      else
        return false
      end
    end
  end
end

