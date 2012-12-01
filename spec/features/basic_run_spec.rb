describe 'it can exceute the main file' do
  it "should return normal exit status" do
    command = "ruby ../../get_rtp_stats"
    system(command).should be_false
  end
end
