require 'printer'

describe Printer do
  it "can store commands" do
    printer = Printer.new
    printer.add_command("my command")
    printer.commands.should include "my command"
  end
end
