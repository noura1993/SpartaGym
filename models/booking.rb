require_relative('../db/sql_runner')

class Booking

    attr_reader :id
    attr_accessor :member_id, :sparta_class_id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @member_id = options['member_id'].to_i
        @sparta_class_id = options['sparta_class_id'].to_i
    end

end