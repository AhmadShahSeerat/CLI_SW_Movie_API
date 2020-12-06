class CLI

    def begin
        puts "#####################"
        puts "Welcome to the amazing starwars API!"
        puts "loading..."
        API.web_info 
        main_menu_options
    end

    def main_menu_options
        puts "Type '1' to list characters"
        puts "Type 'exit' to exit program"
        main_menu
    end

    def main_menu
        input = get_input

        if input == "1"
            list_actors
            main_menu_options
    
        elsif input == "exit"
            puts "Exiting Program"
            exit
        else
            invalid_choice
            main_menu_options
        end
    end

    def invalid_choice
        puts "Invalid Choice. Please Try Again!"
    end

    def get_input
        print "Enter Choice: "
        gets.chomp
    end

    def list_actors
        Actor.all.each.with_index(1) do |actor, index|
            puts "#{index}. #{actor.name}"
        end

        actor_details_menu_options
    end

    def actor_details_menu_options
        puts "Select the number next to the character you wish to know more about."
        puts "Or type 'exit' to exit program"
        actor_details_menu
    end

    def actor_details_menu
        input = get_input

        if input.to_i.between?(1, Actor.all.length)
            
            index = input.to_i - 1
            actor = Actor.all[index]
            print_actor_details(actor)
            select_again_or_exit
        elsif input == "exit"
            puts "Exiting Program"
            exit
        else
            invalid_choice
            actor_details_menu_options
        end
    end

    def print_actor_details(actor)
        puts "-----------------"
        puts "actor Name: #{actor.name}"
        puts "actor Birthyear: #{actor.birth_year}"
        puts "actor Hair Color: #{actor.hair_color}"
        puts "actor Homeworld: #{actor.homeworld_url}"
        puts "-----------------"
    end

    def select_again_or_exit
        puts "Would you like to go back to the main menu or exit?"
        puts "'1' for main menu"
        puts "'exit' to exit program"
        input = get_input

        if input == '1'
            main_menu_options
        elsif input == "exit"
            puts "Goodbye!"
            exit
        else
            invalid_choice
            select_again_or_exit
        end
    end
end
