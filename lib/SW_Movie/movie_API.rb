
        class API

            def self.uurl
                "https://swapi.dev/api"
            end
        
            def self.web_info
                all_actors
            end
        
            def self.all_actors
                page_number = 1
        
                while true
                    response = RestClient.get(uurl + "/people/?page=#{page_number}") 
                    data = JSON.parse(response.body)
                   
                    data["results"].each do |actors_data|
                        Actor.new(actors_data)
                    end
        
                    if data["next"].nil?
                        break
                    end
        
                    page_number += 1
                end
            end
        end
        
        