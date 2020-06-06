require_relative('../db/sql_runner')

class SpartaClass

    attr_reader :id
    attr_accessor :class_name, :capacity, :trainer_name, :room, :day, :time, :status

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @class_name = options['class_name']
        @capacity = options['capacity']
        @trainer_name = options['trainer_name']
        @room = options['room']
        @day = options['day']
        @time = options['time']
        @status = options['status']
    end

    def save()
        sql = "INSERT INTO sparta_classes 
        (class_name, 
        capacity,
        trainer_name,
        room,
        day,
        time,
        status) 
        VALUES 
        ($1, 
        $2,
        $3,
        $4, 
        $5,
        $6,
        $7) 
        RETURNING id;"
        values = [@class_name, @capacity, @trainer_name, @room, @day, @time, @status]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i
    end

end