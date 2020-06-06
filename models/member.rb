require_relative('../db/sql_runner')

class Member

    attr_reader :id
    attr_accessor :title, :first_name, :surname, :mobile_number, :email_address, :status, :membership

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @title = options['title']
        @first_name = options['first_name']
        @surname = options['surname']
        @mobile_number = options['mobile_number']
        @email_address = options['email_address']
        @status = options['status']
        @membership = options['membership']
    end

    def save()
        sql = "INSERT INTO members 
        (title, 
        first_name,
        surname,
        mobile_number,
        email_address,
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
        values = [@title, @first_name, @surname, @mobile_number, @email_address, @status, @membership]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i
    end


end