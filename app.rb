require( 'sinatra' )
require 'sinatra/activerecord'
require( 'sinatra/contrib/all' )


class App < Sinatra::Base
	get('/') do
		erb( :index )
	end
end
