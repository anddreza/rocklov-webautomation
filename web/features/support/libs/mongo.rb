require 'mongo'

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB
    attr_accessor :client, :users, :equipos

    def initialize 
        @client = Mongo::Client.new(CONFIG["mongo"])
        @users = client[:users]
        @equipos = client[:equipos]

    end 
    def remove_user(email)
        # client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
        # users = client[:users]
        @users.delete_many({email: email})
    end

    def drop_danger 
        @client.database.drop
    end 

    def insert_users(docs)
        @users.insert_many(docs)
    end 

    def get_user(email)
        # client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
        # users = client[:users]
        user = @users.find({email: email}).first
        return user[:_id]
    end 

    def remove_equipo(name, email)
        user_id = get_user(email)
        # client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
        # equipos = client[:equipos]
        @equipos.delete_many({name: name, user: user_id})
    end 
end

# MongoDB.new.get_user("betao@yahoo.com")