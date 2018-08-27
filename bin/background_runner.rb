require 'bunny'
require_relative '../lib/background_worker'
require_relative '../app/do_any_job'

server = BackgroundWorker::Server.new
puts 'Starting server...'

server.run!
