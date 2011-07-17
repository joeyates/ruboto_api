module Ruboto

  class Api

    def initialize
    end

    def import
      ActiveRecord::Base.transaction do
        clear_database
        doc.xpath( '/api/package/class' ).each do | klass_element |
          klass = Ruboto::Api::Klass.create!( attributes_to_hash( klass_element.attributes ) )
          puts "#{klass_element.attributes["name"]}"
          klass_element.xpath( 'method' ).each do | method_element |
            puts "\t#{method_element.attributes["name"]}"
            method_attributes = attributes_to_hash( method_element.attributes )
            method = Ruboto::Api::Method.create!( method_attributes.merge( :klass_id => klass.id ) )
            method_element.xpath( 'parameter' ).each do | parameter_element |
              puts "\t\t#{parameter_element.attributes["name"]}"
              parameter_attributes = attributes_to_hash( parameter_element.attributes )
              parameter = Ruboto::Api::Parameter.create!( parameter_attributes.merge( :method_id => method.id ) )
            end
          end
        end
      end
    end

    private

    def clear_database
      ActiveRecord::Base.connection.execute( 'delete from parameters;' )
      ActiveRecord::Base.connection.execute( 'delete from methods;' )
      ActiveRecord::Base.connection.execute( 'delete from klasses;' )
    end

    def doc
      @doc if @doc
      load
      @doc
    end

    def load
      File.open( ANDROID_API_XML ) do | file |
        @doc = Nokogiri::XML( file )
      end
    end

    def attributes_to_hash( attributes )
      attributes.reduce( {} ) do | memo, attribute |
        memo[ attribute[ 0 ] ] = attribute[ 1 ].value
        memo
      end
    end

  end

end
