class Actor
        attr_accessor :name, :birth_year, :hair_color, :homeworld_url, :homeworld 
    
        @@all = []
    
        def initialize(data)
            
            self.name = data["name"]
            self.birth_year = data["birth_year"]
            self.hair_color = data["hair_color"]
            self.homeworld_url = data["homeworld"]
            @@all << self
        end
    
        def self.all
            @@all
        end
    end
    
    
    