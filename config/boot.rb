require 'bundler/setup'
Bundler.require(:default, :development)

MODE = ENV['RACK_ENV'] || 'development'

require 'yaml'

require './lib/minimongo.rb'
