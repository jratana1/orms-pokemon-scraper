class Pokemon
   attr_accessor  :name, :type, :id, :db

    def initialize(id: nil, name:, type:, db:)
        @name = name
        @type = type
        @db = db
        @id = id
    end

    def self.save(name, type, db)
        sql = <<-SQL
        INSERT INTO pokemon (name, type) 
        VALUES (?, ?)
      SQL
  
      db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
        SELECT * FROM pokemon
        WHERE pokemon.id = #{id}
        SQL

        row = db.execute(sql)[0]

        Pokemon.new(id: row[0], name: row[1],type: row[2],db: db)
    end
end