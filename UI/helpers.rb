require 'os'

module Helpers
  def continue
    puts 'Press ENTER key to continue...'
    gets
  end

  def clear_screen
    system('cls') if OS.windows?
    system('clear') if OS.posix?
  end
end
