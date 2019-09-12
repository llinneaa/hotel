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

    #friend/'mentor' helped with refactoring overlap code
    #she explained the single '&' is 'bitwise' code and is used more often in lower-level languages. It is comparing the object's date range array with the inputted object's date range array and pushes those similarities into an array. If they have no similarities (e.g. the array is empty), it returns false (indicating there is no overlap). If the array contains any dates, it returns true (indicating overlap) because the array will be filled with overlapping dates.
    #typically 'other' is used, but for my understanding I used the parameter 'input'
    def overlap?(input)
      if self.createDateArray & input.createDateArray != []
        return true
      else
        return false
      end
    end
  end
end

