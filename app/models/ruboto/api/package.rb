class Ruboto::Api::Package < ActiveRecord::Base
  has_many :klasses, :dependent => :destroy

  extend NokiogiriHelper

  def self.import( package_element )
    puts "#{package_element.attributes["name"]}"
    package_attributes = attributes_to_hash( package_element.attributes )
    package = Ruboto::Api::Package.create!( package_attributes )
    package_element.xpath( 'class' ).each do | klass_element |
      Ruboto::Api::Klass.import( klass_element, package )
    end
  end
end
