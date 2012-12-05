class Printer
  attr_reader :commands

  def initialize
    @commands = []
  end

  def add_command(command)
    commands << command
  end

  def print_to_screen
    commands.each do |command|
      print_verbose(command)
    end
  end

  def request
    commands.join("\n") + "\n"
  end
end
