require_relative './background_worker/client'
require_relative './background_worker/server'

module BackgroundWorker
  def client
    Client.instance
  end

  def perform_later(args = nil)
    message = {
      klass: self.name,
      args: args
    }
    message = Marshal.dump(message)
    client.exchange.publish(message)
  end
end
