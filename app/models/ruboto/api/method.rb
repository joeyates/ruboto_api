class Ruboto::Api::Method < ActiveRecord::Base
  belongs_to :klass
  has_many   :parameters, :dependent => :destroy

  extend NokiogiriHelper

  def self.import( method_element, klass )
    puts "\t\t#{method_element.attributes["name"]}"
    method_attributes = attributes_to_hash( method_element.attributes )
    method = Ruboto::Api::Method.create!( method_attributes.merge( :klass_id => klass.id ) )
    method_element.xpath( 'parameter' ).each do | parameter_element |
      Ruboto::Api::Parameter.import( parameter_element, method )
    end
  end

end
