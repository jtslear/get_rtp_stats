class GraphiteServer
  attr_reader :address, :port

  def initialize(options = {})
    @address = options[:address]
    @port = options[:port]
  end

  def valid?
    !address.nil?
  end

  def send_request(request)
    if valid?
      begin
        socket = TCPSocket.open(address, port)
        socket.write(request)
        socket.close
      rescue
        print_verbose("Send to graphite #{address} failure")
      end
    else
      print_verbose("Graphite server not specified, not sending data anywhere")
    end
  end
end
