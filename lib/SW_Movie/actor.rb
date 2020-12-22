class Actor
        attr_accessor :name, :birth_year, :hair_color, :eye_color 
    
        @@all = []
    
        def initialize(data)
            
            self.name = data["name"]
            self.birth_year = data["birth_year"]
            self.hair_color = data["hair_color"]
            self.eye_color = data[""]
            @@all << self
        end
    
        def self.all
            @@all
        end
    end
    
    
    