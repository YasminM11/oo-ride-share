require_relative 'csv_record'

module RideShare
  class Driver < CsvRecord
    attr_reader :id, :name, :vin, :status, :trips
    
    def initialize(id:, name:, vin:, status: :AVAILABLE, trips: [ ])
      super(id.to_i)
      
      @name = name.to_s
      if vin.length == 17 
        @vin = vin.to_s
      else 
        raise ArgumentError.new("Incorrect VIN length")
      end
      
      if [:AVAILABLE, :UNAVAILABLE].include?(status) == true 
        @status = status.to_sym
      else 
        raise ArgumentError.new("Invalid status")
      end
      @trips = trips 
      
      
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
