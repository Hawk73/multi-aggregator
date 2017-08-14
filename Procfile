release: bundle exec rake db:migrate
web: bundle exec puma -C config/puma.rb
clockwork: bundle exec clockwork config/clockwork.rb >> log/clockwork.log 2>&1
