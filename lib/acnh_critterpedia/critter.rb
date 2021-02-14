class AcnhCritterpedia::Critter

    attr_reader :name, :location, :catch_phrase, :time_range, :is_all_year, :is_all_day
    attr_accessor :month_range
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
        @@all << self
    end


    def print_attributes
        puts <<-CRITTER_INFO

    #{"Name:".light_cyan} #{name.capitalize}
    #{"Months Available:".light_cyan} #{is_all_year ? "All Year" : month_range}
    #{"Hours Available:".light_cyan} #{is_all_day ? "All Day" : time_range}
    #{"Location:".light_cyan} #{location == nil ? "Ocean" : location}
    #{"Catch Phrase:".light_cyan} #{catch_phrase}
        CRITTER_INFO
    end
    

end