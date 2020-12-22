class CLI

    def begin
        puts ""
        puts "I welcome you to the S.T movie API!"
        puts ""
        puts "┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴
        ┴┴┴┴████┴┴┴▐█┴┴┴█▌┴┴█▌┴┴┴┴┴┴┴┴┴████┴┴┴┴┴┴┴┴███████┴┴┴┴██▌┴┴┴┴┴┴┴┴┴┴
        ┴┴┴┴█▌┴┴▀▀┴▐█┴┴▐█┴┴▐██┴┴┴┴┴┴┴┴┴┴████┴┴┴┴▀███▀┴┴┴┴┴██▌┴┴██┴┴┴┴┴┴┴┴┴┴
        ┴┴┴┴██┴┴┴┴┴┴▄▌▐██▌┴▐█┴┴┴┴┴┴┴┴┴┴┴┴┴┴█▌┴┴┴┴┴██┴┴┴┴┴┴┴█▌┴┴██┴┴┴┴┴┴┴┴┴┴
        ┴┴┴┴██┴┴┴┴┴▐█┴▐█┴█┴██┴┴┴┴┴┴┴┴┴███┴┴█▌┴┴┴┴┴██┴┴┴┴┴▄██▌┴┴▐█┴┴┴┴┴┴┴┴┴┴
        ┴┴┴┴▀████┴┴┴████████▌┴┴┴┴┴┴┴┴┴██▄▄▄██┴┴┴┴▐████▄████▀┴┴███┴┴┴┴┴┴┴┴┴┴
        ┴┴┴┴┴┴┴┴┴██┴▐██▌▐███┴┴┴┴┴┴┴┴┴█████████┴┴┴▐█▌▀┴███▀┴┴┴███▀┴┴┴┴┴┴┴┴┴┴
        ┴┴┴┴┴┴┴┴┴██┴┴██┴┴██▌┴┴┴┴┴┴┴┴██▀▀┴┴┴┴█▌┴┴┴▐█▌┴┴┴┴┴┴┴┴███┴┴┴┴┴┴┴┴┴┴┴┴
        ┴┴┴┴┴┴┴┴┴██┴┴█▌┴┴██┴┴┴┴┴┴┴┴███┴┴┴┴┴██▌┴┴┴┴█▌┴┴┴┴┴┴┴▐██┴┴┴┴┴┴┴┴┴┴┴┴┴
        ┴┴┴┴┴┴┴┴┴█▌┴▐█┴┴┴██┴┴┴┴┴┴┴███┴┴┴┴┴███┴┴┴┴▐█┴┴┴┴┴┴┴┴▐█┴┴┴┴┴┴┴┴┴┴┴┴┴┴
        ┴┴███████▀┴┴▐█┴┴▐█┴┴┴┴┴┴┴┴██┴┴┴┴┴┴█┴┴┴┴┴┴┴█┴┴┴┴┴┴┴┴▐█┴┴┴┴┴┴┴┴┴┴┴┴┴┴
        ┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴
        ┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴
         "
        puts "loading..."
        puts ""
        API.web_info 
        main_menu_options
    end
    
    def main_menu_options
        puts ""
        puts "We have all actors of SW movie!"
        puts ""
        puts "Press '1' to load all actors."
        puts "Or type 'exit' to leave the program."
        puts ""
        main_menu
    end

    def main_menu
        input = get_input
        if input == '1'
            list_actors
    
        elsif input == "exit"
            puts "Leaving the Program."
            exit
        else
            invalid_choice
            main_menu_options
        end
    end

    def invalid_choice
        puts ""
        puts "-----------------"
        puts "Wrong Entry. Please enter again!"
        puts "-----------------"

    end

    def get_input
        puts "Please make a selection to proceed!"
        gets.chomp
    end

    def list_actors
        Actor.all.each.with_index(1) do |actor, index|
            puts "#{index}. #{actor.name}"
        end

        actor_details_menu_options
    end

    def actor_details_menu_options
        puts ""
        puts "Choose the number next to the actor you wish to know more about."
        puts "-----------------"
        puts "Or type 'exit' to leave the program"
        puts "-----------------"
    
        actor_details_menu
    end

    def actor_details_menu
        input = get_input

        if input.to_i.between?(1, Actor.all.length) 
            
            index = input.to_i - 1 #the index starts with zero, but we have already start our index from one, we want to make sure whatever they put should be minus one to be exactly what the program is about
            actor = Actor.all[index]
            print_actor_details(actor)
            choose_or_leave
        elsif input == "exit"
            puts "Leaving the program"
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

    def choose_or_leave
        puts "-----------------"
        puts "Do you want to know about other characters too?"
        puts "-----------------"
        puts "Press '1' for main menu or 'exit' to leave the program"
       
        input = get_input

        if input == '1'
            main_menu_options
        elsif input == "exit"
            puts "Check back soon!!"
            exit
        else
            invalid_choice
           choose_or_leave
        end
    end
end
