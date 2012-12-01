def print_verbose(input,options={})
  if $VERBOSE
    if options[:print_line] == false
      print input
    else
      puts input
    end
  end
end
