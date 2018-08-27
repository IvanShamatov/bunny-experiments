module BackgroundWorker
  class Server
    def client
      Client.instance
    end

    def run!
      queue = client.channel.queue('').bind(client.exchange)
      queue.subscribe(block: true) do |_, _, payload|
        message = Marshal.load(payload)
        klass = Object.const_get(message[:klass])
        args = message[:args]
        puts "executing #{klass}#perform with args: #{args}"
        klass.new.perform(args)
      end
    end
  end
end
