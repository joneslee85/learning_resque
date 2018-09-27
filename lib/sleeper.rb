class Sleeper
  @queue = 'test_worker'

  def self.perform(seconds)
    sleep seconds
    Resque.logger.debug("Sleeper Job #{self.object_id} completes after #{seconds} second(s)")
  end
end
