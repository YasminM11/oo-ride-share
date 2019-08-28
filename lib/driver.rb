require_relative 'csv_record'

module RideShare
  class Driver < CsvRecord
    attr_reader :id, :name, :vin, :status, :trips
    
    def initialize(id:, name:, vin:, status: :AVAILABLE, trips: [])
      super(id)
      
      @name = name.to_s
      if vin.length == 17 
        @vin = vin.to_s
      else 
        raise ArgumentError.new("Incorrect VIN length")
      end
      
      # puts 'statusstatus'
      # puts status
      
      # statusstatus = ["AVAILABLE", "UNAVAILABLE"]
      
      status = "AVAILABLE"
      
      if status == :AVAILABLE || status == :UNAVAILABLE
        @status = status.to_sym
      else 
        # raise ArgumentError.new("Invalid status")
      end
      @trips = trips 
      
      
    end
    
    private
    
    def self.from_csv(record)
      return new(
        id: record[:id],
        name: record[:name],
        vin: record[:vin],
        status: record[:status]
      )
    end
  end
end
