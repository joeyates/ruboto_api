class Ruboto::Api::Parameter < ActiveRecord::Base
  belongs_to :method

  extend NokiogiriHelper

  def self.import( parameter_element, method )
    puts "\t\t\t#{parameter_element.attributes["name"]}"
    parameter_attributes = attributes_to_hash( parameter_element.attributes )
    parameter = Ruboto::Api::Parameter.create!( parameter_attributes.merge( :method_id => method.id ) )
  end

end
