#!/usr/bin/env ruby

require 'sinatra/base'
require 'ruboto'
require 'ruboto/api'
require 'ruboto/util/scan_in_api'
require 'ruboto/util/xml_element'

=begin


=end



class RubotoApiApp < Sinatra::Base

  get '/' do
    api = Ruboto::Api::api
    "#{api.root.name}"
  end

end
