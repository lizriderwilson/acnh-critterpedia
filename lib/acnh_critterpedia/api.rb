# require_relative '../acnh_critterpedia/critter.rb'

# resp = HTTParty.get("https://acnhapi.com/v1a/fish/bitterling")

# puts resp

class Api
    attr_accessor :url

    def initialize(url)
        @url = url
    end

    def search_critter_by_name(name, critter_type)
        # https://acnhapi.com/v1a/fish/
        req_url = "#{url}/#{critter_type}/#{name}"
        data = HTTParty.get(req_url)
        
        critter_hash = {
            name: data["name"]["name-USen"],
            location: data["availability"]["location"],
            catch_phrase: data["catch-phrase"],
            months: data["availability"]["month-array-northern"],
            hours: data["availability"]["time-array"]
        }

        critter = Critter.new(critter_hash)

    end

end
