

class Cli
    attr_accessor :critterpedia_api

    def run

        puts "Welcome to Critterpedia! Right now, it is #{Time.now.strftime("%l:%M%p - %A, %B %e %Y")}"

        print "Which hemisphere are you playing in? (northern/southern): "
        hemisphere = gets.chomp.downcase
        while hemisphere != "northern" && hemisphere != "southern" do
            if hemisphere == "north" || hemisphere == "south"
                hemisphere += "ern"
            else
                print "Hmm...I don't recognize that hemisphere. Please enter 'northern' or 'southern'!"
                hemisphere = gets.chomp.downcase
            end
        end

        @critterpedia_api = Api.new(hemisphere)
        puts "You're in the #{hemisphere.capitalize}ern Hemisphere! We'll be sure to display your results accordingly."
        puts "Please take a look at the following options:"
        list_options

        input = ""
        while input != "exit"
            puts "What would you like to do now? Type 'options' for a list of available commands."
            input = gets.strip

            case input
            when "options"
                list_options
            when "1"
                available_critters("fish")
            when "2"
                available_critters("bugs")
            when "3"
                available_critters("sea")
            when "4"
                critters_by_month("fish")
            when "5"
                critters_by_month("bugs")
            when "6"
                critters_by_month("sea")
            when "7"
                critters_by_name("fish")
            when "8"
                critters_by_name("bugs")
            when "9"
                critters_by_name("sea")
            end
        end
    end

    def list_options
        format = {header: false, format: "table"}
        data = [
            ["1. View Available Fish", "2. View Available Bugs", "3. View Available Sea Creatures"],
            ["4. View Fish by Month", "5. View Bugs by Month", "6. View Sea Creatures by Month"],
            ["7. Search Fish by Name", "8. Search Bugs by Name", "9. Search Sea Creatures by Name"]
        ]

        presenter = CliFormat::Presenter.new(format)
        data.each do |row|
            presenter.rows << row
        end
        presenter.show
        puts "Type 'exit' to close the program."
    end

    def available_critters(critter_type)
        puts critterpedia_api.critters_available_now(critter_type)
    end

    def critters_by_month(critter_type)
        print "Please choose a month (1-12) to see the #{critter_type == "sea" ? critter_type + " creatures" : critter_type} available that month: "
        month = gets.chomp.to_i

        puts critterpedia_api.search_critters_by_month(month, critter_type)
    end

    def critters_by_name(critter_type)
        print "Please type the name of the #{critter_type == "sea" ? critter_type + " creatures" : critter_type} you'd like to learn more about: "
        name = gets.chomp.gsub(" ", "_").gsub("'", "").downcase

        critter = critterpedia_api.search_critter_by_name(name, critter_type)
        critter.print_attributes
    end

end