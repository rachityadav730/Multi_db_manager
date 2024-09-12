require 'arangodb-ruby'

module MultiDbManager
  class ArangoDBAdapter
    def initialize(config)
      @client = Arango::Client.new(config)
    end

    def execute_query(query)
      @client.query(query)
    end

    def fetch_data(query)
      @client.query(query).to_a
    end
  end
end
