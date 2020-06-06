require_relative('../db/sql_runner')

class Member

    attr_reader :id
    attr_accessor :title, :first_name, :surname, :mobile_number, :email_address, :status, :membership

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @title = options['title']
        @first_name = options['first_name']
        @surname = options['surname']
        @mobile = options['mobile']
        @email = options['email']
        @status = options['status']
        @membership = options['membership']
    end

    def save()
        sql = "INSERT INTO members 
        (title, 
        first_name,
        surname,
        mobile,
        email,
        status,
        membership) 
        VALUES 
        ($1, 
        $2,
        $3,
        $4, 
        $5,
        $6,
        $7) 
        RETURNING id;"
        values = [@title, @first_name, @surname, @mobile, @email, @status, @membership]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i
    end

    def update()
        sql = "UPDATE members SET 
        title = $1, 
        first_names = $2,  
        surname = $3,
        mobile = $4,
        email = $5,
        status = $6,
        membership = $7
        WHERE id = $8;"
        values = [@title, @first_name, @surname, @mobile, @email, @status, @membership, @id]
        SqlRunner.run(sql, values)
    end

    def self.find(id)
        sql = 'SELECT * FROM members WHERE id = $1;'
        values = [id]
        member_record = SqlRunner.run(sql, values).first()
        return nil if member_record == nil
        return Member.new(member_record)
    end

    def self.map(member_data)
        return member_data.map{ |member| Member.new(customer) }
    end

end