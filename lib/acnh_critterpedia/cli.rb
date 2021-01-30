

class Cli
    attr_accessor :critterpedia_api

    def run

        puts "#{"Welcome to Critterpedia!".light_green} Right now, it is #{Time.now.strftime("%l:%M%p - %A, %B %e %Y")}\n\n"

        print "Which hemisphere are you playing in? (#{"northern".light_magenta}/#{"southern".light_magenta}): "
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
        puts "You're in the #{hemisphere.capitalize}ern Hemisphere! We'll be sure to display your results accordingly.\n\n"
        list_options

        input = ""
        while input != "exit"
            print "What would you like to do now? Type '#{"options".light_magenta}' for a list of available commands."
            input = gets.strip

            case input
            when "options"
                list_options
            when "about"
                about_program
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

        table = Terminal::Table.new do |t|
            t.title = "Options (pick a number)"
            t.add_row ["1. View Available #{"Fish".cyan}", "2. View Available #{"Bugs".green}", "3. View Available #{"Sea Creatures".blue}"]
            t.add_row ["4. View #{"Fish".cyan} by Month", "5. View #{"Bugs".green} by Month", "6. View #{"Sea Creatures".blue} by Month"]
            t.add_row ["7. Search #{"Fish".cyan} by Name", "8. Search #{"Bugs".green} by Name", "9. Search #{"Sea Creatures".blue} by Name"]
            t.style = {:all_separators => true}
        end

        puts table
        puts "Type '#{"about".light_magenta}' for more information."
        puts "Type '#{"exit".light_magenta}' to close the program.\n\n"
    end

    def about_program
        puts "* #{"View Available [Critter]".green.bold} (options 1-3) will list all of the critters of the chosen type that are available to catch right now."
        puts "* #{"View [Critter] by Month]".green.bold} (options 4-6) asks you to choose a month (1-12) and lists all the critters of the chosen type that can be caught during that month."
        puts "* #{"Search [Critter] by Name]".green.bold} (options 7-9) will list the months and time of day the critter can be caught, where it can be caught, and its catch phrase."
        puts "* When searching by month or name, critters that are currently available to be caught will be #{"highlighted in yellow".yellow}!\n\n"
    end

    def parse_name(string)
        string.gsub(" ", "_").gsub("'", "").downcase
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
        # name = gets.chomp.gsub(" ", "_").gsub("'", "").downcase
        name = parse_name(gets.chomp)

        critter = critterpedia_api.search_critter_by_name(name, critter_type)
        critter.print_attributes
    end

end