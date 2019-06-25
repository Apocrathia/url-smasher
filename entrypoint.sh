#!/bin/bash

tor -f /etc/tor/torrc &>/dev/null &

exec torsocks bash ~/url-smasher.sh -u $@
