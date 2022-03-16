require_relative './UI/app'
require_relative './UI/helpers'

def main
  @wrong_option = "Error!\nPlease select a valid option"
  @choose_option_message = 'Enter an option number here: '
  @app = App.new

  @greeting = lambda do
    include Helpers
    clear_screen
    message = "HI!\n"\
              'Welcome to My collection App'
    puts message
    continue
    @home_menu.call
  end

  @home_menu = lambda do
    include Helpers
    clear_screen
    menu = "Please select one collection by entering a number:\n"\
           "1 - Books\n"\
           "2 - Music\n"\
           "E - Exit\n"
    puts menu
    @home_menu_handler.call
  end

  @home_menu_handler = lambda do
    include Helpers
    puts @choose_option_message
    user_selection = gets.chomp.upcase
    case user_selection
    when '1'
      puts 'select 1'
      @books_menu.call
    when '2'
      puts 'select 2'
      @music_menu.call
    when 'E'
      clear_screen
      @app.save_data
      puts 'Have a nice day ;D'
      gets
      clear_screen
    else
      puts @wrong_option
      continue
      @home_menu.call
    end
  end

  @books_menu = lambda do
    include Helpers
    clear_screen
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

    puts @choose_option_message
    user_selection = gets.chomp.upcase
    case user_selection
    when '1'
      puts 'Listing all books... (the proper method needs to be called here)'
      @app.list_books
      continue
      @books_menu.call
    when '2'
      puts 'Listing all labels... (the proper method needs to be called here)'
      @app.restore_data
      @app.list_labels
      continue
      @books_menu.call
    when '3'
      puts 'Adding new books... (the proper method needs to be called here)'
      @app.add_book
      continue
      @books_menu.call
    when 'R'
      @home_menu.call
    else
      puts @wrong_option
      @books_menu.call
    end
  end

  @music_menu = lambda do
    include Helpers
    clear_screen
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
    puts @choose_option_message
    user_selection = gets.chomp.upcase
    case user_selection
    when '1'
      puts 'Listing all music albums... (the proper method needs to be called here)'
      continue
      @music_menu.call
    when '2'
      puts 'Listing all genres... (the proper method needs to be called here)'
      continue
      @music_menu.call
    when '3'
      puts 'Adding new music album... (the proper method needs to be called here)'
      continue
      @music_menu.call
    when 'R'
      @home_menu.call
    else
      puts @wrong_option
      @music_menu.call
    end
  end

  @greeting.call
end

main
