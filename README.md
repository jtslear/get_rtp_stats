get_rtp_stats
=============

Get a count of all active RTP sessions

# Usage: 
```
Usage: get_rtp_stats [options]
    -d, --device x y z               Input list of devices seperated by a comma
    -g, --graphite String            Input hostname of the graphite server
    -p, --port Integer               Input port number for graphite instance
    -C, --community String           Specify snmp community
    -v, --verbose                    Run verbosely (debugging only)
    -V, --version                    Prints Version of this script.
    -h, --help                       Show help message
```

Data is printed in graphite format

# Example:
```
get_rtp_stats -d hostname1,hostname2
```

# Notes:
This script will only output to graphite if a server is specified.  The default port to sending to graphite is port 2003.  

Testing is completed using rspec.  Adjust tests as neccessary to model your environment.
