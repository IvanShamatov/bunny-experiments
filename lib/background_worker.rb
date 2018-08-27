require_relative './background_worker/client'
require_relative './background_worker/server'
require 'pry'

module BackgroundWorker
  def client
    Client.instance
  end

  def perform_later(args = nil)
    message = {
      class_name: self.name,
      args: args
    }
    client.publish(message)
  end
end
