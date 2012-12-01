require 'graphite_server'

describe GraphiteServer do
  it "has an address" do
    server = GraphiteServer.new(address: "192.168.1.1")
    server.address.should == "192.168.1.1"
  end

  it "has a port"  do
    server = GraphiteServer.new(port: "2003")
    server.port.should == "2003"
  end
end
