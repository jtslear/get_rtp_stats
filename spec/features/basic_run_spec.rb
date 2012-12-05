describe 'it can exceute the main file' do
  it "should return the help output" do
    return_text = `ruby get_rtp_stats`
    return_text.should include "Usage: get_rtp_stats [options]"
    return_text.should_not include "Script begin, verbose option enabled"
  end

  it "should return normal exit status" do
    return_text = `ruby get_rtp_stats -d 127.0.0.1 -g 192.168.1.1 -p 2003 -C public -v `
    return_text.should include 'Script begin, verbose option enabled'
    return_text.should include 'rtp_stats.127.0.0.1'
  end

  it "should indicate that a graphite server was not requested" do
    return_text = `ruby get_rtp_stats -d 127.0.0.1 -v`
    return_text.should include "Graphite server not specified, not sending data anywhere"
  end
end
