web: bundle exec puma -C config/puma.rb
clockwork: bundle exec clockwork config/clockwork.rb >> log/clockwork.log 2>&1
prepare_requests: bundle exec sidekiq -C config/sidekiq/prepare_requests.yml
process_requests: bundle exec sidekiq -C config/sidekiq/process_requests.yml
