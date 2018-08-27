require 'pry'

module BackgroundWorker
  class Server
    def client
      Client.instance
    end

    def run!
      queue = client.channel.queue('background_jobs').bind(client.exchange)
      queue.subscribe(block: true) do |delivery_info, properties, payload|
        puts delivery_info.inspect
        puts properties.inspect
        puts payload.inspect
      end
    end
  end
end
