require_relative '../config/environment'
# begin cli

def start
    clear_screen
    # get user
    user = user_login_or_register

    puts "loading..."
    game = Game.new(user: user)
    
    clear_screen
    welcome_message(game.user)
    # start game loop
    game_loop(game)
end

def game_loop(game)
    # populate grid with events and passengers
    Driver.all.each do |d|
        puts "#{d.user.name} is driving today!"
    end
end

def welcome_message(user)
    puts "Hi there, #{user.name}!"
    # add instructions
    sleep(2)
    clear_screen
end

def user_login_or_register
    puts "Are you a new user?(y/n)"
    user_exists?
end

def user_exists?
    current_user = nil
    user_input = get_user_input
    until user_input == "y" || user_input == "n"
        invalid_user_input
        puts "Are you a new user?(y/n)"
        user_exists?
    end

    if user_input == "y"
        puts "Enter your name: "
        new_user_name = get_user_input
        puts "Enter your email: "
        new_user_email = get_user_input
        user = User.find_by_email(new_user_email).first
        if user
            # user exists
            puts "User"
            current_user = user
        else
            # create new user
            current_user = new_user(new_user_name, new_user_email)
        end
    else
        # ask for user email and find by email
        puts "Enter your email: "
        user_email = get_user_input
        current_user = User.find_by_email(user_email).first
    end
    current_user
end

def new_user(name, email)
    user = User.create(name: name, email: email, npc: false)
    Driver.create(name: user.name, user: user, location: "tl-0-0")
    user
end

def get_user_input
    gets.chomp
end

def invalid_user_input
    puts "...that's not one of the choices I gave you. Try again."
    sleep(2)
    clear_screen
end

def clear_screen
    system("clear") || system("cls")
end

start


# binding.pry