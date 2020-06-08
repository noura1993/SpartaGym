require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/sparta_class.rb' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )


get('/sparta_classes') do
    @sparta_classes = SpartaClass.upcoming_classes()
    erb(:"sparta_classes/index")
end

get('/sparta_classes/new') do
    erb(:"sparta_classes/new")
end

post('/sparta_classes') do
    sparta_class = SpartaClass.new(params)
    sparta_class.save
    redirect to("/sparta_classes")
end

get('/sparta_classes/:id/edit') do
    @sparta_class = SpartaClass.find(params['id'])
    erb(:"sparta_classes/edit")
end
  
post('/sparta_classes/:id') do
    sparta_class = SpartaClass.new(params)
    sparta_class.update
    redirect to "/sparta_classes"
end

get('/sparta_classes/:id/class_members') do
    @sparta_class = SpartaClass.find(params['id'])
    @class_members = @sparta_class.members()
    erb(:'sparta_classes/class_members')
end
  
post('/sparta_classes/:class_id/:member_id/remove') do
    @sparta_class = SpartaClass.find(params['class_id'])
    @member = Member.find(params['member_id'])
    @sparta_class.remove_member(@member)
    redirect to("/sparta_classes/#{@sparta_class.id}/class_members")
end


