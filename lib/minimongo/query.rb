module Minimongo
  module Query

    # # # # # # # #
    # The Query class does setup and executes the queries
    # It's just the thinnest layer possible on top of the MongoDB driver
    #

    def self.included(base)

      # Accessors
      attr_accessor :errors

      # Init
      def initialize(a = {})
        # Errors
        @errors = Hash.new{|h, k| h[k] = []}

        # Attributes
        a.each{|k, v| instance_variable_set("@#{k}", v)}
      end

      base.extend ClassMethods

      # Instance methods, mirrors the class methods
      base.class_eval do

        # Find, insert, update, delete, just calls the class methods
        [:find, :update, :delete, :insert].each do |m|
          class_eval %Q{def #{m}(*g); self.class.#{m} *arg(g); end}
        end

        # Object ID
        def oid(v); self.class.oid(v); end

        # Args
        def arg(g)
          # Insert the collection if none found
          g.insert(0, "#{self.class.to_s.downcase}s".to_sym) if g[0].is_a?(Hash)
          # Insert the ID into the query if it exists
          g[1].merge!(:_id => (@_id ||= BSON::ObjectId.new)) if g[1].is_a?(Hash)
          g
        end

      end
    end

    # Class methods
    module ClassMethods

      # String to BSON::ObjectId
      def oid(v)
        BSON::ObjectId.from_string(v) rescue v
      end

      # Find. Returns a cursor
      def find(*g)
        Minimongo.db[col(g)].find(*g)
      end

      # Insert and return the result
      def insert(*g)
        Minimongo.db[col(g)].insert_one(*g)
      end

      # Update
      def update(*g)
        Minimongo.db[col(g)].update_one(*g)
      end

      # Delete
      def delete(*g)
        Minimongo.db[col(g)].delete_one(*g)
      end

      private

      # Collection
      def col(g)
        g[0].is_a?(Symbol) ? g.delete_at(0) : "#{self.to_s.downcase}s".to_sym
      end

    end
  end
end
