require_relative 'test_helper'
require 'rake'
SimpleCov.start

describe "DateRange class" do
  #similar to before statement in trip_dispatcher 'build_test_dispatcher'
  #ranges will be instances of DateRange
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

    #update overlap method in date_range to refactor test (wave 2)
    # it "makes sure dates don't overlap" do
    #   range_array = @new_range.createDateArray
    #   test_start_date = "2001/5/14"
    #   test_end_date = "2001/5/17"
    #   test_range = create_new_range(test_start_date, test_end_date)
    #   test_range_array = test_range.createDateArray
    #   range_array.each do |date|
    #     expect(test_range_array).wont_include date
    #   end
    #end

    # it "accesses list of reservations for specific date" do

    # end
  end
end
