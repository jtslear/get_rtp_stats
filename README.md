get_rtp_stats
=============

Get a count of all active RTP sessions

Usage: get_rtp_stats [options]                                                                           
    -d, --device x y z               Input list of devices seperated by a comma                          
    -C, --community String           Specify snmp community                                              
    -V, --verbose                    Run verbosely (debugging only)                                      
    -v, --version                    Prints Version of this script.                                      
    -h, --help                       Show help message 

Data is printed in graphite format
Example:
rtp_stats.hostname1 9 12353093359
rtp_stats.hostname2 0 12353093359
rtp_stats.total 9 12353093359
