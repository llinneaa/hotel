require_relative 'test_helper'
require 'rake'
SimpleCov.start

describe "DateRange class" do
  describe "DateRange instantiation" do
    before do
      @date = Hotel::DateRange.new(
        start_date: "2001/2/3",
        end_date: "2001/2/5",
        duration: 2,
        date_range: ["2001/2/3", "2001/2/4", "2001/2/5"]
      )
    end

    it "is an instance of DateRange" do
      expect(@date).must_be_kind_of Hotel::DateRange
    end

    it "throws an argument error if dates overlap" do
      expect { Hotel::DateRange.new(start_date: "2001/2/5", end_date: "2001/2/3") }.must_raise ArgumentError
    end

    it "creates an array of all dates" do
      expect(@date.createDateArray(@start_date, @end_date)).must_be_kind_of Array
    end
  end
end