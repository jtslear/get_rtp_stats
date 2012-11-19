get_rtp_stats
=============

Get a count of all active RTP sessions

# Usage: 
```
get_rtp_stats [options]                                                                           
    -d, --device x y z               Input list of devices seperated by a comma, this can be "unlimited" 
    -g, --graphite String            Input hostname of the graphite server
    -C, --community String           Specify snmp community                                              
    -v, --verbose                    Run verbosely (debugging only, will not send data to graphite when run verbosely)                                      
    -V, --version                    Prints Version of this script.                                      
    -h, --help                       Show help message 
```

Data is printed in graphite format

# Example:
```
get_rtp_stats -d hostname1,hostname2
rtp_stats.hostname1 9 12353093359
rtp_stats.hostname2 0 12353093359
rtp_stats.total 9 12353093359
```
