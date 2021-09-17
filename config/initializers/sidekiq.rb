Sidekiq.configure_server do |config|
    config.redis = { 
      url: 'redis://localhost:3000'
    }
end