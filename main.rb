require_relative './UI/app'
require_relative './UI/helpers'

def main
  @app = App.new()
  
  @home_menu = lambda do
    menu = "Please select one collection by entering a number:\n"\
    "1 - Books\n"\
    "2 - Music\n"\
    "E - Exit\n"
    puts menu
    @home_menu_handler.call
  end
  
  @home_menu_handler = lambda do
    include Helpers
    puts Choose_option_message
    user_selection = gets.chomp.upcase
    case user_selection
    when "1"
      puts 'select 1'
      @books_menu.call
    when "2"
      puts 'select 2'
      @music_menu.call
    when "E"
      puts 'Have a nice day ;D'
      gets
    else
      puts Wrong_option
      @home_menu.call
    end
  end

  @books_menu = lambda do
    menu = "Please select one option by entering a number:\n"\
    "1 - List all books\n"\
    "2 - List all labels\n"\
    "3 - Add new book\n"\
    "R - Return to home menu\n"
    puts menu
    @books_menu_handler.call
  end
  
  
  @books_menu_handler = lambda do
    include Helpers
    puts Choose_option_message
    user_selection = gets.chomp.upcase
    case user_selection
    when "1"
      puts 'Listing all books... (the proper method needs to be called here)'
      gets
      @books_menu.call
    when "2"
      puts 'Listing all labels... (the proper method needs to be called here)'
      gets
      @books_menu.call
    when "3"
      puts 'Adding new books... (the proper method needs to be called here)'
      gets
      @books_menu.call
    when "R"
      clear_screen
      @home_menu.call
    else
      puts Wrong_option
      @books_menu.call
    end
  end


  @music_menu = lambda do
    menu = "Please select one option by entering a number:\n"\
    "1 - List all music albums\n"\
    "2 - List all genres\n"\
    "3 - Add new music album\n"\
    "R - Return to home menu\n"
    puts menu
    @music_menu_handler.call
  end
  
  @music_menu_handler = lambda do
    include Helpers
    puts Choose_option_message
    user_selection = gets.chomp.upcase
    case user_selection
    when "1"
      puts 'Listing all music albums... (the proper method needs to be called here)'
      gets
      @music_menu.call
    when "2"
      puts 'Listing all genres... (the proper method needs to be called here)'
      gets
      @music_menu.call
    when "3"
      puts 'Adding new music album... (the proper method needs to be called here)'
      gets
      @music_menu.call
    when "R"
      clear_screen
      @home_menu.call
    else
      puts Wrong_option
      @music_menu.call
    end
  end

  @home_menu.call
end
main