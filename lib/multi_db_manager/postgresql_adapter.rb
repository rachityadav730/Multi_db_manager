require 'pg'

module MultiDbManager
  class PostgreSQLAdapter
    def initialize(config)
      @conn = PG.connect(config)
    end

    def execute_query(query)
      @conn.exec(query)
    end

    def fetch_data(query)
      @conn.exec(query).to_a
    end
  end
end
