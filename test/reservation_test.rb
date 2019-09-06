require_relative 'test_helper'
require 'rake'

describe "Reservation class" do
  describe "Reservation instantiation" do
    before do
      @reservation = Hotel::Reservation.new(
        reservation_id: 1,
        room_number: [4],
        cost: 400
      )
    end

    it "is an instance of Reservation" do
      expect(@reservation).must_be_kind_of Hotel::Reservation
    end
  end
end
