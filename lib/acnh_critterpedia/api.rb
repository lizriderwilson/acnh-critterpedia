# require_relative '../acnh_critterpedia/critter.rb'

# resp = HTTParty.get("https://acnhapi.com/v1a/fish/bitterling")

# puts resp

class Api
    attr_accessor :url, :hemisphere

    def initialize(hemisphere)
        @url = "https://acnhapi.com/v1a"
        @hemisphere = hemisphere
    end

    def search_critter_by_name(name, critter_type)
        # https://acnhapi.com/v1a/fish/
        req_url = "#{url}/#{critter_type}/#{name}"
        data = HTTParty.get(req_url)
        
        critter_hash = {
            name: data["name"]["name-USen"],
            location: data["availability"]["location"],
            catch_phrase: data["catch-phrase"],
            months: data["availability"]["month-array-#{hemisphere}"],
            hours: data["availability"]["time-array"]
        }

        critter = Critter.new(critter_hash)
    end

    def search_critters_by_month(month, critter_type)
        req_url = "#{url}/#{critter_type}/"
        data = HTTParty.get(req_url)

        critter_list = data.select do |critter|
            critter["availability"]["month-array-#{hemisphere}"].include?(Time.now.month)
        end

        list_critter_names(critter_list)
    end

    def critters_available_now(critter_type)
        req_url = "#{url}/#{critter_type}/"
        data = HTTParty.get(req_url)

        critter_list = data.select do |critter|
            critter["availability"]["month-array-#{hemisphere}"].include?(Time.now.month) &&  critter["availability"]["time-array"].include?(Time.now.hour)
        end

        list_critter_names(critter_list)
    end

    def list_critter_names(critter_list)
        critter_list.map {|critter| critter["name"]["name-USen"]}
    end

end
