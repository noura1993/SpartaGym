require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
require_relative( '../models/sparta_class.rb' )
also_reload( '../models/*' )


get('/members') do
    @members = Member.all()
    erb(:"members/index")
end

get('/members/new') do
    erb(:"members/new")
end

post('/members') do
    member = Member.new(params)
    member.save
    redirect to("/members")
end

get('/members/:id/edit') do
    @member = Member.find(params['id'])
    erb(:"members/edit")
end
  
post('/members/:id') do
    member = Member.new(params)
    member.update
    redirect to "/members"
end

get('/members/:id/book_class') do
    @member = Member.find(params['id'])
    @sparta_classes = SpartaClass.bookable_classes(@member)
    erb(:"members/book_class")
end

post('/members/:class_id/:member_id/book') do 
    sparta_class = SpartaClass.find(params['class_id'])
    member = Member.find(params['member_id'])
    sparta_class.book_class(member)
    redirect to "/members"
end

get("/members/:id/classes") do
    @member = Member.find(params['id'])
    @sparta_classes = @member.sparta_classes()
    erb(:"members/member_classes")
end
  
post('/members/:class_id/:member_id/remove') do
    @sparta_class = SpartaClass.find(params['class_id'])
    @member = Member.find(params['member_id'])
    @sparta_class.remove_member(@member)
    redirect to("/members/#{@member.id}/classes")
end
