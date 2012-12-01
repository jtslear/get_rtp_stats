class GraphiteServer
  attr_reader :address, :port

  def initialize(options = {})
    @address = options[:address]
    @port = options[:port]
  end

  def valid?
    !address.nil? && !port.nil?
  end

  def send_request(request)
    if $VERBOSE
      print_verbose("Not sending data to #{address} while in verbose mode")
    else
      begin
        socket = TCPSocket.open(adddress, port)
        socket.write(request)
        socket.close
      rescue
        print_verbose("Send to #{address} failure")
      end
    end
  end
end
