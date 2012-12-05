class CommandLineOptions
  def self.parse(args)
    script_version = "0.10"
    options = OpenStruct.new
    options.device_list = []
    options.community = "public" # default to a common community string
    options.warning = "0"
    options.critical = "0"
    options.exit_status = "3"
    options.maximum = "0"
    options.verbose = false
    options.graphite_server_port = "2003" # set to the default graphite tcp port

    opts = OptionParser.new do |user_input|
      user_input.banner = "Usage: #{user_input.program_name} [options]"
      user_input.on("-d x y z", "--device x y z", Array, "Input list of devices seperated by a comma") do |device|
        options.device_list = device
      end
      user_input.on("-g String", "--graphite String", String, "Input hostname of the graphite server") do |graphite|
        options.graphite_server = graphite
      end
      user_input.on("-p Integer", "--port Integer", Integer, "Input port number for graphite instance") do |port|
        options.graphite_server_port = port
      end
      user_input.on("-C String", "--community String", String, "Specify snmp community") do |community|
        options.community = community
      end
      user_input.on("-v", "--verbose", "Run verbosely (debugging only)") do |verbose|
        $VERBOSE = true
      end
      user_input.on("-V", "--version", "Prints Version of this script.") do
        puts "get_rtp_stats #{script_version}"
        exit
      end
      user_input.on_tail("-h", "--help", "Show help message") do
        puts opts
        exit
      end
    end

    begin
      if args.empty?
        puts opts
      else
        opts.parse!(args)
      end
    rescue OptionParser::InvalidOption
      puts opts
      exit
    end
    options

  end

end
