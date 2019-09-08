require_relative 'test_helper'
require 'rake'
SimpleCov.start

describe "DateRange class" do
  before do
    def create_new_range(start_date:, end_date:)
      return Hotel::DateRange.new(start_date, end_date)
    end
  describe "DateRange instantiation" do
    before do
      @start_date = "2001/2/3"
      @end_date = "2001/2/5"
      #@date_range = create_new_range("2001/2/3", "2001/2/5")
      # @date_range = Hotel::DateRange.new(
      #   start_date: "2001/2/3",
      #   end_date: "2001/2/5"
      # )
      @new_range = create_new_range(start_date: @start_date, end_date: @end_date)
    end

    it "is an instance of DateRange" do
      expect(@new_range).must_be_instance_of Hotel::DateRange
    end
  end

    it "throws an argument error if dates are invalid" do
      expect{ Hotel::DateRange.new(start_date: "2001/2/5", end_date: "2001/2/3") }.must_raise ArgumentError
    end
  end

  describe "DateRange methods" do
    before do
      @date_range = Hotel::DateRange.new(
        start_date: "2001/2/3",
        end_date: "2001/2/5"
      )
      #@new_range = create_new_range(@date_range.start_date, @date_range.end_date)
    end

    it "creates an array of all dates" do
      expect(@new_range).must_be_kind_of Array
      range = (@date_range.start_date...@date_range.end_date).to_a
      puts range
      @new_range.each do |date|
        expect(date).must_be_instance_of Date
        expect(range).must_include date
      end
      p @date_range
    end

    it "does not include end date in the date range" do
      expect(@date_range.createDateArray(@date_range.start_date, @date_range.end_date)).wont_include @date_range.end_date
    end

    it "accesses list of reservations for specific date" do

    end
  end
end
