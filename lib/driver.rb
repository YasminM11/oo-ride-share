require_relative 'csv_record'

module RideShare
  class Driver < CsvRecord
    attr_reader :id, :name, :vin, :status, :trips
    
    def initialize(id:, name:, vin:, status: :AVAILABLE, trips: [])
      super(id.to_i)
      
      @name = name.to_s
      if vin.length == 17 
        @vin = vin.to_s
      else 
        raise ArgumentError.new("Incorrect VIN length")
      end
      
      @status = status.to_sym
      unless [:AVAILABLE, :UNAVAILABLE, "AVAILABLE", "UNAVAILABLE"].include?(@status) 
        raise ArgumentError.new("Invalid Driver Status")
      end
      @trips = trips 
      
      
    end
    
    def add_trip(trip)
      @trips << trip
    end
    
    private
    
    def self.from_csv(record)
      return new(
        id: record[:id],
        name: record[:name],
        vin: record[:vin],
        status: record[:status],
      )
    end
  end
end
