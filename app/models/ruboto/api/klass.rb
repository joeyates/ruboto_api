class Ruboto::Api::Klass < ActiveRecord::Base
  set_table_name :klasses
  has_many :methods, :dependent => :destroy

  extend NokiogiriHelper

  def self.import( klass_element, package )
    puts "\t#{klass_element.attributes["name"]}"
    klass_attributes = attributes_to_hash( klass_element.attributes )
    klass = Ruboto::Api::Klass.create!( klass_attributes.merge( :package_id => package.id ) )
    klass_element.xpath( 'method' ).each do | method_element |
      Ruboto::Api::Method.import( method_element, klass )
    end
  end

end
