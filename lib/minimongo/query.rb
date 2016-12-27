module Minimongo
  module Query

    # String to BSON::ObjectId
    def oid(v)
      BSON::ObjectId.from_string(v) rescue BSON::ObjectId.new
    end

    # Find. Returns a cursor
    def find(*g)
      Minimongo.db[g.shift].find(*g)
    end

    # Insert and return the result
    def insert(*g)
      Minimongo.db[g.shift].insert_one(*g)
    end

    # Update
    def update(*g)
      Minimongo.db[g.shift].update_one(*g)
    end

    # Delete
    def delete(*g)
      Minimongo.db[g.shift].delete_one(*g)
    end

  end
end
