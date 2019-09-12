require_relative 'test_helper'
require 'rake'

describe "DateRange class" do
  #similar to before statement in trip_dispatcher 'build_test_dispatcher'
  #new_range is instance of DateRange
  before do
    def new_range(start_date, end_date)
      return Hotel::DateRange.new(start_date, end_date)
    end
  end

  describe "DateRange instantiation" do
    before do
      @start_date = "2001/2/3"
      @end_date = "2001/2/5"
      @new_range = new_range(@start_date, @end_date)
    end

    it "is an instance of DateRange" do
      expect(@new_range).must_be_instance_of Hotel::DateRange
    end

    it "raises an argument error if dates are invalid" do
      expect{new_range("2001/2/5", "2001/2/3")}.must_raise ArgumentError
    end

    it "creates an array of all dates, excluding reservation end date" do
      test_range = @new_range.createDateArray
      expect(test_range).must_be_kind_of Array
      expect(test_range).wont_include @new_range.end_date
    end

    #test includes one array with dates that overlap with the range_array and one array with dates that do not. The test for the overlapping dates returns true and the test for the non-overlapping dates returns false.
    it "makes sure dates don't overlap" do
      range_array = new_range("2001/2/3", "2001/2/5")
      test_array_with_overlap = new_range("2001/2/4", "2001/2/6")
      test_array_with_no_overlap = new_range("2001/5/14", "2001/5/17")

      overlap_test = @new_range.overlap?(test_array_with_overlap)
      no_overlap_test = @new_range.overlap?(test_array_with_no_overlap)

      expect(overlap_test).must_equal true
      expect(no_overlap_test).must_equal false
    end
  end
end
