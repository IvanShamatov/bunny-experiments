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
      @exchange ||= channel.fanout('sidekick')
    end

    def close
      @connection.close
    end
  end
end
