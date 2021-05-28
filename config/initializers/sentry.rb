Raven.configure do |config|
  config.dsn = ENV['SENTRY_DSN']

  # config.async = lambda do |event|
  #   Raven.send_event(event)
  # end  
end