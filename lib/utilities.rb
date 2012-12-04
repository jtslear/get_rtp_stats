def check_for_libsmi
  unless SNMP::MIB.import_supported? then
    puts "libsmi package required; yum install libsmi"
    exit
  end
end

def print_verbose(input,options={})
  if $VERBOSE
    if options[:print_line] == false
      print input
    else
      puts input
    end
  end
end
