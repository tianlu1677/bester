# frozen_string_literal: true

Sidekiq::Extensions.enable_delay!
Sidekiq.default_worker_options = { 'backtrace' => true }

redis_url = "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}/#{ENV['REDIS_JOB_DB']}"
Sidekiq.configure_server do |config|
  config.redis = { url: redis_url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url }
end

schedule_file = 'config/sidekiq_schedule.yml'

if File.exist?(schedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end

# Sidekiq::Web.use Rack::Auth::Basic do |username, password|
#   [username, password] == ['good', 'today']
# end