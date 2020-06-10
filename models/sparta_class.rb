require('date')
require_relative('../db/sql_runner')
require_relative('./member')
require_relative('./booking')

class SpartaClass

    attr_reader :id
    attr_accessor :class_name, :capacity, :trainer_name, :room, :date_time, :status

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @class_name = options['class_name']
        @capacity = options['capacity'].to_i
        @trainer_name = options['trainer_name']
        @room = options['room']
        @date_time = options['date_time']
        @status = options['status']
    end

    def book_class(member)
        @capacity -= 1
        update()
        new_booking = Booking.new({'member_id' => member.id, 'sparta_class_id' => @id})
        new_booking.save()
    end

    def remove_member(member)
        @capacity += 1
        update()
        Booking.delete(member.id, @id)
    end

    def members()
        sql = "SELECT members.* 
        FROM members
        INNER JOIN bookings
        ON members.id = bookings.member_id
        WHERE sparta_class_id = $1;"
        values = [@id]
        members_records = SqlRunner.run(sql, values)
        return Member.map(members_records)
    end

    def save()
        sql = "INSERT INTO sparta_classes 
        (class_name, 
        capacity,
        trainer_name,
        room,
        date_time,
        status) 
        VALUES 
        ($1, 
        $2,
        $3,
        $4, 
        $5,
        $6) 
        RETURNING id;"
        values = [@class_name, @capacity, @trainer_name, @room, @date_time, @status]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i
    end

    def update()
        sql = "UPDATE sparta_classes SET 
        class_name = $1, 
        capacity = $2,  
        trainer_name = $3,
        room = $4,
        date_time = $5,
        status = $6
        WHERE id = $7;"
        values = [@class_name, @capacity, @trainer_name, @room, @date_time, @status, @id]
        SqlRunner.run(sql, values)
    end

    def self.find(id)
        sql = 'SELECT * FROM sparta_classes WHERE id = $1;'
        values = [id]
        sparta_class_record = SqlRunner.run(sql, values).first()
        return nil if sparta_class_record == nil
        return SpartaClass.new(sparta_class_record)
    end

    def self.map(sparta_class_data)
        return sparta_class_data.map{ |sparta_class| SpartaClass.new(sparta_class) }
    end

    def self.bookable_classes(member)
        return [] if member.status == "Deactivated"
        member_classes = member.sparta_classes().map{ |sparta_class| sparta_class.id }
        upcoming_classes = SpartaClass.upcoming_classes()
        return upcoming_classes.select{ |upcoming_class| upcoming_class.status == "Active" && upcoming_class.capacity > 0 }
                               .select{ |upcoming_class| member.membership == "Premium" || upcoming_class.date_time[11..15] < '20:00' }
                               .select{ |upcoming_class| !member_classes.include? (upcoming_class.id) }
    end

    def self.upcoming_classes()
        current_date_time = DateTime.now
        today = current_date_time.strftime("%Y/%m/%d %H:%M")

        sql = "SELECT * FROM sparta_classes WHERE date_time >= $1;"
        values = [today]
        sparta_classes = SqlRunner.run(sql, values)
        return SpartaClass.map(sparta_classes)
    end


    def self.search(class_name = '', trainer_name = '', date_time = '')
        sql = 'SELECT * FROM sparta_classes WHERE UPPER(class_name) LIKE UPPER($1) AND UPPER(trainer_name) LIKE UPPER($2) AND UPPER(date_time) LIKE UPPER($3);'
        values = ["%#{class_name}%", "%#{trainer_name}%", "%#{date_time}%"]
        sparta_classes_records = SqlRunner.run(sql, values)
        return SpartaClass.map(sparta_classes_records)
    end

end