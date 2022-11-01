module Searchable
    extend ActiveSupport::Concern
  
    included do
      include Elasticsearch::Model
      include Elasticsearch::Model::Callbacks
  
      settings do
        mappings dynamic: false do
            indexes :message, type: :string
        end
      end
  
      def self.search(query)
        params = {
            query: {
              match: {
                message: query,
              },
            },
          }
        self.__elasticsearch__.search(query)
      end
    end
  end