CornerstoneCms::Application.configure do
  
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  config.contact_recipient = 'nathanwise@gmail.com' 
  
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',       # required
      :aws_access_key_id      => 'AKIAIYVXI72NNWA6SNFA',       # required
      :aws_secret_access_key  => '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',       # required
      :region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = 'northcantonchurch-dev'                     # required
    config.fog_host       = 'http://northcantonchurch_development.s3-website-us-east-1.amazonaws.com/'            # optional, defaults to nil
    config.fog_public     = false                                   # optional, defaults to true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end
  
end

