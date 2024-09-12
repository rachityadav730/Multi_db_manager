require "multi_db_manager/version"
require "multi_db_manager/mysql_adapter"
require "multi_db_manager/mongo_adapter"
require "multi_db_manager/arangodb_adapter"
require "multi_db_manager/postgresql_adapter"

module MultiDbManager
  class Database
    def initialize(adapter_type, config)
      @adapter = case adapter_type
                 when :mysql
                   MySQLAdapter.new(config)
                 when :mongo
                   MongoAdapter.new(config)
                 when :arangodb
                   ArangoDBAdapter.new(config)
                 when :postgresql
                   PostgreSQLAdapter.new(config)
                 else
                   raise "Unsupported database type"
                 end
    end

    def execute_query(query)
      @adapter.execute_query(query)
    end

    def fetch_data(query)
      @adapter.fetch_data(query)
    end
  end
end
