require "pry"

class AcnhCritterpedia::API
    attr_accessor :url

    def initialize
        @url = "https://acnhapi.com/v1a"
    end

    def import_critters
        critter_type_array = ["fish", "bugs", "sea"]

        critter_type_array.each do |critter_type|
            req_url = "#{url}/#{critter_type}/"
            data = HTTParty.get(req_url)
            data.each do |critter|
                critter_hash = {
                    type: critter_type,
                    name: critter["name"]["name-USen"],
                    location: critter["availability"]["location"],
                    catch_phrase: critter["catch-phrase"],
                    month_northern: critter["availability"]["month-northern"],
                    month_southern: critter["availability"]["month-southern"],
                    month_array_northern: critter["availability"]["month-array-northern"],
                    month_array_southern: critter["availability"]["month-array-southern"],
                    is_all_year: critter["availability"]["isAllYear"],
                    time_range: critter["availability"]["time"],
                    is_all_day: critter["availability"]["isAllDay"]
                }
                critter = AcnhCritterpedia::Critter.new(critter_hash)
                binding.pry
            end
        end
    end

    # def search_critters_by_month(month, critter_type)
    #     req_url = "#{url}/#{critter_type}/"
    #     data = HTTParty.get(req_url)

    #     critter_list = data.select do |critter|
    #         critter["availability"]["month-array-#{hemisphere}"].include?(month)
    #     end

    #     list_critter_names(critter_list)
    # end

    # def critters_available_now(critter_type)
    #     req_url = "#{url}/#{critter_type}/"
    #     data = HTTParty.get(req_url)

    #     critter_list = data.select do |critter|
    #         critter["availability"]["month-array-#{hemisphere}"].include?(Time.now.month) &&  critter["availability"]["time-array"].include?(Time.now.hour)
    #     end

    #     list_critter_names(critter_list)
    # end

    # def list_critter_names(critter_list)
    #     critter_list.map {|critter| critter["name"]["name-USen"]}
    # end

end
