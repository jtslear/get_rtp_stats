describe 'it can exceute the main file' do
  it "should return normal exit status" do
    return_text = `ruby get_rtp_stats -d 192.168.5.11 -g 192.168.5.11 -p 2003 -C public -v `

    return_text.should include 'Verbose option enabled'
    return_text.should include '192.168.5.11 down, no SNMP manager created'
    return_text.should include 'Not sending data to 192.168.5.11 while in verbose mode'
  end

  it "should have the correct ip" do
    return_text = `ruby get_rtp_stats -d 192.168.5.11 -g 192.168.5.11 -p 2003 -C public -v `

    return_text.should include '192.168.5.11'
  end

  # it "should raise an exeception if port is missing" do
  #   command = "ruby get_rtp_stats -d 192.168.5.11 -g 192.168.5.11  -C public -v "

  #   expect{ system(command) }.to raise_error ArgumentError
  # end
end
