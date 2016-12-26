module Minimongo

  # # # # # #
  # Minimongo MongoDB Ruby app helpers
  # @homepage: https://github.com/fugroup/minimongo
  # @author:   Vidar <vidar@fugroup.net>, Fugroup Ltd.
  # @license:  MIT, contributions are welcome.
  # # # # # #

end

require_relative 'minimongo/query'

# Connect
# $db = Mongo::Client.new([ '127.0.0.1:27017' ], :database => "minimongo_#{MODE}")

# Indexing
# $db[:profiles].indexes.create_one({:key => 1}, :unique => true)

# Info on MongoDB Driver
# https://docs.mongodb.com/ruby-driver/master/quick-start/
# http://zetcode.com/db/mongodbruby/
# http://recipes.sinatrarb.com/p/databases/mongo
# https://github.com/steveren/ruby-driver-sample-app/blob/master/lib/neighborhood.rb
