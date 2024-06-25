# config/initializers/resque.rb
require 'resque'
require 'resque/scheduler'
require 'resque/scheduler/server'

Resque.redis = Redis.new(url: 'redis://localhost:6379')

# Optional: Schedule file for Resque Scheduler
# Resque.schedule = YAML.load_file(Rails.root.join('config', 'resque_schedule.yml')) if File.exists?(Rails.root.join('config', 'resque_schedule.yml'))
