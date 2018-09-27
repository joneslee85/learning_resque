REDIS_URL = ENV["REDIS_URL"] || 'redis://127.0.0.1:6381/'

Resque.logger = Logger.new(STDOUT).tap do |logger|
                  logger.level = Logger::DEBUG
                  logger.formatter = proc do |severity, datetime, progname, msg|
                    { type: severity, time: datetime.utc.iso8601(3), message: msg }.to_json + "\n"
                  end
                end
url = REDIS_URL.gsub("redis://", "").gsub("/", "")
$stderr.puts "Using redis: #{url}"
Resque.redis = "#{url}:dewey"

require 'resque'
require 'resque/failure/redis'

Resque::Failure.backend = Resque::Failure::Redis
