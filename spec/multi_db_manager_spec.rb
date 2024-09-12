RSpec.describe MultiDbManager::Database do
    let(:mysql_config) { { host: "localhost", username: "root", database: "test" } }
    let(:mongo_config) { { uri: "mongodb://localhost:27017", database: "test" } }
    let(:arangodb_config) { { url: "http://localhost:8529", database: "test" } }
    let(:postgresql_config) { { host: "localhost", dbname: "test", user: "postgres" } }
  
    it "executes MySQL queries" do
      db = described_class.new(:mysql, mysql_config)
      result = db.execute_query("SELECT * FROM users")
      expect(result).to be_an_instance_of(Array)
    end
  
    it "executes MongoDB queries" do
      db = described_class.new(:mongo, mongo_config)
      result = db.execute_query(collection: "users", filter: {})
      expect(result).to be_an_instance_of(Array)
    end
  
    it "executes ArangoDB queries" do
      db = described_class.new(:arangodb, arangodb_config)
      result = db.execute_query("FOR user IN users RETURN user")
      expect(result).to be_an_instance_of(Array)
    end
  
    it "executes PostgreSQL queries" do
      db = described_class.new(:postgresql, postgresql_config)
      result = db.execute_query("SELECT * FROM users")
      expect(result).to be_an_instance_of(Array)
    end
  end
  