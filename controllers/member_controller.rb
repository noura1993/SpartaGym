require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
require_relative( '../models/sparta_classes.rb' )
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