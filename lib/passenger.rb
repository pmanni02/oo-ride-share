require 'pry'
module RideShare
  class Passenger
    attr_reader :id, :name, :phone_number, :trips

    def initialize(input)
      if input[:id] == nil || input[:id] <= 0
        raise ArgumentError.new("ID cannot be blank or less than zero.")
      end

      @id = input[:id]
      @name = input[:name]
      @phone_number = input[:phone]
      @trips = input[:trips] == nil ? [] : input[:trips]
    end

    def get_drivers
      @trips.map{ |t| t.driver }
    end

    def add_trip(trip)
      @trips << trip
    end

    def total_spent
      total = trips.inject(0) do |sum, trip|
        trip.cost != nil ? sum += trip.cost : sum += 0
      end
      return total
    end

    def total_time
      return trips.inject(0) {|sum, trip| sum += trip.duration_in_seconds}
    end

  end
end
