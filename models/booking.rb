require_relative('../db/sql_runner')

class Booking

    attr_reader :id
    attr_accessor :member_id, :sparta_class_id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @member_id = options['member_id'].to_i
        @sparta_class_id = options['sparta_class_id'].to_i
    end

    def save()
        sql = "INSERT INTO bookings 
        (member_id, sparta_class_id) 
        VALUES 
        ($1, $2) 
        RETURNING id;"
        values = [@member_id, @sparta_class_id]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i
    end

    def update()
        sql = "UPDATE bookings SET 
        member_id = $1, 
        sparta_class_id = $2
        WHERE id = $3;"
        values = [@member_id, @sparta_class_id, @id]
        SqlRunner.run(sql, values)
    end

    def self.delete(member_id, sparta_class_id)
        sql = "DELETE FROM bookings WHERE member_id = $1 AND sparta_class_id = $2;"
        values = [member_id, sparta_class_id]
        SqlRunner.run(sql, values)
    end

end