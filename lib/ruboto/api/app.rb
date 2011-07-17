#!/usr/bin/env ruby

require 'sinatra/base'
require 'ruboto'
require 'ruboto/api'
require 'ruboto/util/scan_in_api'
require 'ruboto/util/xml_element'

=begin


=end



class RubotoApiApp < Sinatra::Base

  get '/:package/:klass' do
    package = Ruboto::Api::Package.find_by_name( params[ :package ] )
    klass   = package.klasses.find_by_name( params[ :klass ] )
    klass.name
  end

end
