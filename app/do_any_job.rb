require 'bunny'
require_relative '../lib/background_worker'

class DoAnyJob
  extend BackgroundWorker

  def perform(*args)
    f = File.new('out', 'w')
    f.write('1234567890')
    f.close
  end
end

DoAnyJob.perform_later
