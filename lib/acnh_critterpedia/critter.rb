class Critter

    # Attributes for Critter class
    # name[name-USen]
    # availability[month-array-northern, month-array-southern, time-array, location]
    # catch-phrase

    attr_reader :name, :location, :catch_phrase, :hours, :time_range, :is_all_year, :is_all_day
    attr_accessor :months, :month_range
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

    def print_attributes
        puts <<-CRITTER_INFO
    Name: #{name.capitalize}
    Months Available: #{is_all_year ? "All Year" : month_range}
    Hours Available: #{is_all_day ? "All Day" : time_range}
    Location: #{location}
    Catch Phrase: #{catch_phrase}
        CRITTER_INFO
    end

    def available_this_month?
    end

    def available_this_hour?
    end

    def available_now?
    end

end