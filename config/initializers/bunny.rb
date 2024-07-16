# config/initializers/bunny.rb
require 'bunny'

connection = Bunny.new
connection.start

Rails.application.config.bunny = connection
