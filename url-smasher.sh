#!/bin/bash
# URL Smasher
# The whole point of this is to generate a ton of fake page hits
# Connect to Tor, grab a random user agent, hit a webpage, rinse, & repeat

# Credits
# Alexander Sadovsky (https://github.com/Alino/url-torape)
# SQLmap (https://github.com/sqlmapproject/sqlmap)

# Usage information
usage() { 
    echo "Usage: $0 [-u <url>] [-w <wait_time>]"
    echo "For more detailed information on how to use this script, just read the source code."
    exit 1
}

# Set some default arguments (in case we don't get any)
url='http://icanhazip.com'
wait_time=5

# Parse arguments
# -u = URL
# -w = Wait time
while getopts ":u:w:" opt; do
    case "${opt}" in
        u)
            url=${OPTARG}
            ;;
        w)
            wait_time=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done

# Let the user know what we're doing
echo "Commence the smashing. Press [CTRL+C] to stop."

# Import all of the user agents
source user_agents

# Grab a random user agent
random_user_agent=${USER_AGENT[$RANDOM % ${#USER_AGENT[@]} ]}

# What IP are we using?
echo "Hitting $url from $(torsocks curl --silent http://icanhazip.com)"

# Hit the target
torsocks curl --silent -A "$random_user_agent" $url > /dev/null
