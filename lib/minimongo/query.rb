module Minimongo
  module Query

    # String to BSON::ObjectId
    def oid(v = nil)
      BSON::ObjectId.from_string(v) rescue BSON::ObjectId.new
    end

    # Find, insert, update, delete
    [:find, :insert, :update, :delete].each do |m|
      class_eval %Q{
        def #{m}(*g)
          Minimongo.db[g.shift].#{m != :find ? "#{m}_one" : m}(*g)
        end
      }
    end

    # First
    def first(*g)
      find(*g).limit(-1).first
    end

    # Last
    def last(*g)
      find(*g).limit(-1).sort(:$natural => -1).first
    end

    # Count
    def count(*g)
      find(*g).count
    end

    # All
    def all(*g)
      find(*g).to_a
    end
  end
end
