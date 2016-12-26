module Minimongo
  module Helpers
    module Query

      def default_options(options = {})
        options[:token] == false ? {} : {:token => s[:u]}
      end

      # DB helper method to turn a string ID
      # representation into a BSON::ObjectId
      def oid(val)
        begin
          BSON::ObjectId.from_string(val)
        rescue BSON::ObjectId::Invalid
          val
        end
      end

      # Find document by id
      def find_by_id(col, id, options = {})
        id = oid(id) unless id.is_a?(BSON::ObjectId)
        return {} unless id.is_a?(BSON::ObjectId)
        $db[col].find(default_options(options).merge(:_id => id)).first || {}
      end

      # Find first
      def first(col, query = {}, options = {})
        cursor(col, query, options).first
      end

      # Count
      def count(col, query = {}, options = {})
        find(col, query, options).count
      end

      # Cursor for query
      def cursor(col, query, options = {})
        k, v = query.to_a.flatten
        if v.blank?
          $db[col].find(default_options(options))
        elsif v.is_a?(Array)
          $db[col].find(default_options(options).merge(k => {'$in' => v}))
        else
          $db[col].find(default_options(options).merge(k => v))
        end
      end

      # Find. Returns the records
      def find(col, query = {}, options = {})
        return find_by_id(col, query) if query.is_a?(String) or query.is_a?(BSON::ObjectId)
        c = cursor(col, query, options)
        c = c.sort(options[:sort]) if options[:sort]
        c.to_a
      end

      # Insert and return the document
      def insert(col, values, options = {})
        d = $db[col].insert_one(default_options(options).merge(values))
        find_by_id(col, d.inserted_id, options)
      end

      # Update
      def update(col, query, values, upsert = true)
        query[:_id] = oid(query[:_id]) if query and query[:_id]
        $db[col].update_one(default_options.merge(query), {'$set' => values}, :upsert => upsert)
      end

      # Delete
      def delete(col, query)
        query[:_id] = oid(query[:_id]) if query and query[:_id]
        $db[col].delete_one(default_options.merge(query))
      end

    end
  end
end
