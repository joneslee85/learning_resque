require 'resque/tasks'

task :environment do
  load File.dirname(__FILE__) + "/config/boot.rb"
end

task "resque:setup" => :environment

