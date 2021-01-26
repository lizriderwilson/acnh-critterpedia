class Critter

    # Attributes for Critter class
    # name[name-USen]
    # availability[month-array-northern, month-array-southern, time-array, location]
    # catch-phrase

    attr_reader :name, :location, :catch_phrase
    attr_accessor :months, :hours
    @@all = []

    def initialize(hash)
        hash.each do |key, value|
            self.instance_variable_set("@#{key}", value)
        end
        save
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

end