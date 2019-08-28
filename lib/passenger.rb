require_relative 'csv_record'

module RideShare
  class Passenger < CsvRecord
    attr_reader :name, :phone_number, :trips

    def initialize(id:, name:, phone_number:, trips: nil)
      super(id)

      @name = name
      @phone_number = phone_number
      @trips = trips || []
    end

    def add_trip(trip)
      @trips << trip
    end

    def net_expenditures
     #return total amount of money spent
     total = 0
     @trips.each do |trip|
       total += trip.cost
     end
     return total
   end
  
   #added by me
   def total_time_spent
     total = 0
     @trips.each do |trip|
       spend_time = trip.end_time - trip.start_time
       total += spend_time
     end
     return total
    end

    private

    def self.from_csv(record)
      return new(
        id: record[:id],
        name: record[:name],
        phone_number: record[:phone_num]
      )
    end
  end
end
