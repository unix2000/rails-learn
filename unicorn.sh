#!/bin/bash
UNICORN=/usr/local/bin/unicorn_rails
killall -9  unicorn_rails
$UNICORN -c /home/liner/Develop/windows_mount/ruby/rails_learn/rails_unicorn.rb -D -E development
