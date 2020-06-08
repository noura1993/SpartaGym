require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/sparta_class.rb' )
also_reload( '../models/*' )


get('/sparta_classes') do
    @sparta_classes = SpartaClass.upcoming_classes()
    erb(:"sparta_classes/index")
end
