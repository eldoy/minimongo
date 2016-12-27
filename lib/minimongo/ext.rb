# # # # # # # # #
# Patch the Mongo::Collection::View class to return documents as models
# If you query the :models collection, if a Model class exists
# and the setting Minimongo.model = true
#
# Set Minimongo.module = 'Fu::Models' if your models is inside a module,
# default module is root '::'
#

module Mongo
  class Collection
    class View

      # To a BSON::Documents or models
      def to_a
        Minimongo.model ? super.map{|d| model(d)} : super
      end

      # First BSON::Document or model
      def first
        Minimongo.model ? model(super) : super
      end

      private

      # Get the model class, BSON::Document if it doesn't exist
      def model(d)
        Object.const_get("#{Minimongo.module}#{self.collection.name[0..-2].capitalize}").new(d.to_hash) rescue d
      end

    end
  end
end

