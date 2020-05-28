#!/bin/bash

cd /usr/src/app

# bin/rails db:setup
# bin/rails db:migrate # RAILS_ENV=development
bin/rails db:prepare

rm -f tmp/pids/server.pid

# rails s -b 0.0.0.0 -p 3000
bundle exec rdebug-ide --host 0.0.0.0 --port 3011 -- bin/rails s -b 0.0.0.0