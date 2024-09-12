require 'mysql2'

module MultiDbManager
  class MySQLAdapter
    def initialize(config)
      @client = Mysql2::Client.new(config)
    end

    def execute_query(query)
      @client.query(query)
    end

    def fetch_data(query)
      @client.query(query).to_a
    end
  end
end
