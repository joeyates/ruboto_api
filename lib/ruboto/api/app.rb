#!/usr/bin/env ruby

require 'sinatra/base'
require 'haml'

class RubotoApiApp < Sinatra::Base

  set :root, File.join( File.dirname( __FILE__ ), 'app' )

  get '/:package' do
    @package = Ruboto::Api::Package.find_by_name( params[ :package ] )
    haml :package
  end

  get '/:package/:klass' do
    @package = Ruboto::Api::Package.find_by_name( params[ :package ] )
    @klass   = @package.klasses.find_by_name( params[ :klass ] )
    haml :klass
  end

end
