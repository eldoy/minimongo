require 'bundler/setup'
Bundler.require(:default, :development)

MODE = ENV['RACK_ENV'] || 'development'

require './lib/minimongo.rb'

# Connect
Minimongo.db = Mongo::Client.new([ '127.0.0.1:27017' ], :database => "minimongo_#{MODE}")

include Futest::Helpers
include Minimongo::Query
