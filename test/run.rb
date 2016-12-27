#!/usr/bin/env ruby

require './config/boot'

# Load tests. Comment out the ones you don't want to run.
begin
  start = Time.now
  [
    'query',
    'model'
  ].each{|t| require_relative "#{t}_test"}
rescue => x
  puts x.message
  e(x)
ensure
  puts Time.now - start
end
