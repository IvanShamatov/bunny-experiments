require 'singleton'

module BackgroundWorker
  class Client
    include Singleton

    def connection
      return @connection if @connection
      @connection = Bunny.new
      @connection.start
    end

    def channel
      @channel ||= connection.create_channel
    end

    def exchange
      @exchange ||= channel.direct('sidekick')
    end

    def close
      @connection.close
    end

    def publish(message)
      message = Marshal.dump(message)
      exchange.publish(message, routing_key: 'background_jobs')
    end
  end
end
