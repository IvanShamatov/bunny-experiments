require 'bunny'
require_relative '../lib/background_worker'

server = BackgroundWorker::Server.new
puts 'Starting server...'

server.run!
