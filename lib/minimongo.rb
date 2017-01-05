require 'mongo'

module Minimongo

  # # # # # #
  # Minimongo MongoDB tiny Ruby library.
  # @homepage: https://github.com/fugroup/minimongo
  # @author:   Vidar <vidar@fugroup.net>, Fugroup Ltd.
  # @license:  MIT, contributions are welcome.
  # # # # # #

  class << self; attr_accessor :db; end
end

require_relative 'minimongo/query'

# Indexing
# Minimongo.db[:profiles].indexes.create_one({:key => 1}, :unique => true)

# Info on MongoDB Driver
# https://docs.mongodb.com/ruby-driver/master/quick-start/
# http://zetcode.com/db/mongodbruby/
# http://recipes.sinatrarb.com/p/databases/mongo
# https://github.com/steveren/ruby-driver-sample-app/blob/master/lib/neighborhood.rb
