# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
config.logger = Logger.new(config.paths["log"].first, 10, 20*1024*1024) # 10 megabytes