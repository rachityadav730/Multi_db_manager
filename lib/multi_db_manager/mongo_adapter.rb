require 'mongo'

module MultiDbManager
  class MongoAdapter
    def initialize(config)
      @client = Mongo::Client.new(config[:uri])
      @database = @client.use(config[:database])
    end

    def execute_query(query)
      collection = @database[query[:collection]]
      collection.find(query[:filter]).to_a
    end

    def fetch_data(query)
      execute_query(query)
    end
  end
end
