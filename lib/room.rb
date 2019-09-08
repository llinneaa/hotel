# is this a necessary class?
module Hotel
  class Room
    def initialize(rooms, cost: nil)
      @rooms = (1..20).to_a
      @cost = cost
    end
  end
end

