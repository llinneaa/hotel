require_relative 'test_helper'
require 'rake'

describe "Reservation class" do
  describe "Reservation instantiation" do
    before do
      @date_range = Hotel::DateRange.new(start_date: "2001/2/3", end_date: "2001/2/5")
      @reservation = Hotel::Reservation.new(
        id: 1,
        room_number: 1,
        date_range: @date_range,
        rate: 200
      )
    end

    it "is an instance of Reservation" do
      expect(@reservation).must_be_kind_of Hotel::Reservation
    end

    it "date_range is an instance of DateRange" do
      puts @reservation.date_range
      expect(@reservation.date_range).must_be_kind_of Hotel::DateRange
    end

    it "finds number of nights and total cost of reservation" do
      nights = @reservation.date_range.duration
      total_cost = @reservation.total_cost(nights)
      expect(total_cost).must_equal 400
    end

    it "asdfasf" do
    end
  end
end
