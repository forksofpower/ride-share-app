require_relative '../config/environment'

# begin cli

def start
    clear_screen
    welcome_message
end


def welcome_message
    puts "Hi there!"
    sleep(2)
    clear_screen
end

def new_user_input
    puts "Are you a new passenger?(y/n)"
end

def clear_screen
    system("clear") || system("cls")
end

start


# binding.pry