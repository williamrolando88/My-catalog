require 'os'

module Helpers
  Wrong_option = "Error!\nPlease select a valid option"
  Choose_option_message = "Enter an option number here: "

  def clear_screen
    system('cls') if OS.windows?
    system('clear') if OS.posix?
  end
end