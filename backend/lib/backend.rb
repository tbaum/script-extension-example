require "sinatra"
require "neo4j"

class Person
  include Neo4j::NodeMixin
  property :name
  has_n :in_love
  index :name
end

class Backend < Sinatra::Base

  configure do
    unless $NEO4J_SERVER
      Neo4j::Config[:storage_path] = '~/Downloads/neo4j-community-1.4/data/graph.db'
    end
    unless Person.find("name: I").first
      Neo4j::Transaction.run do
        me = Person.new :name => "I"
        you = Person.new :name => "You"
        me.in_love << you
      end
    end
  end

  get "/connections/:name" do |name|
    me = Person.find("name: #{name}").first
    return unless me
    Hash[me.in_love.collect { |r| [:love, r.name] }].to_json
  end

end
