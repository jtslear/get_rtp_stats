class Device
  attr_reader :name, :community_auth

  def initialize(name,community_auth)
    @name = name
    @community_auth = community_auth
  end

  def is_up?
    # For some strange reason, ruby cannot create ICMP packets w/o root
    # So lets check that the host is up AND http is listening
    # (specific to our environment!)
    @is_up ||= Net::Ping::TCP.new(name,80,2).ping?
  end

  def status_text
    "#{name} is #{is_up?}"
  end

  def snmp_manager
    @snmp_manager ||= SNMP::Manager.new(:host => name, :community => community_auth)
  end

  def rtp_count
    @rtp_count ||= get_rtp_count
  end

  def graphite_status
    "rtp_stats.#{name}.rtp_active #{rtp_count} #{current_time}"
  end

  def failure_message
    "#{name} down, no SNMP manager created"
  end

  private

  def get_rtp_count
    rtp_active_count = 0
    if is_up?
      begin
        snmp_manager.walk("1.3.6.1.4.1.5003.9.10.1.4.1.1.1") do |index|
          if index.to_s =~ /value=1/
            print_verbose("#{index}")
            rtp_active_count += 1
          else
            print_verbose("#{index}")
          end
        end
      rescue SNMP::RequestTimeout
        print_verbose("No snmp response from #{name}; validate community string?")
      end
    else
      print_verbose(failure_message)
    end

    rtp_active_count
  end

  def current_time
    Time.now.to_i
  end
end
