module Ruboto

  class Api

    def initialize
    end

    def import
      ActiveRecord::Base.transaction do
        clear_database
        doc.xpath( '/api/package' ).each do | package_element |
          import_package( package_element )
        end
      end
    end

    private

    def clear_database
      ActiveRecord::Base.connection.execute( 'delete from parameters;' )
      ActiveRecord::Base.connection.execute( 'delete from methods;' )
      ActiveRecord::Base.connection.execute( 'delete from klasses;' )
      ActiveRecord::Base.connection.execute( 'delete from packages;' )
    end

    def doc
      @doc if @doc
      load
      @doc
    end

    def import_package( package_element )
      puts "#{package_element.attributes["name"]}"
      package_attributes = attributes_to_hash( package_element.attributes )
      package = Ruboto::Api::Package.create!( package_attributes )
      package_element.xpath( 'class' ).each do | klass_element |
        import_klass( klass_element, package )
      end
    end

    def import_klass( klass_element, package )
      puts "\t#{klass_element.attributes["name"]}"
      klass_attributes = attributes_to_hash( klass_element.attributes )
      klass = Ruboto::Api::Klass.create!( klass_attributes.merge( :package_id => package.id ) )
      klass_element.xpath( 'method' ).each do | method_element |
        import_method( method_element, klass )
      end
    end

    def import_method( method_element, klass )
      puts "\t\t#{method_element.attributes["name"]}"
      method_attributes = attributes_to_hash( method_element.attributes )
      method = Ruboto::Api::Method.create!( method_attributes.merge( :klass_id => klass.id ) )
      method_element.xpath( 'parameter' ).each do | parameter_element |
        import_parameter( parameter_element, method )
      end
    end

    def import_parameter( parameter_element, method )
      puts "\t\t\t#{parameter_element.attributes["name"]}"
      parameter_attributes = attributes_to_hash( parameter_element.attributes )
      parameter = Ruboto::Api::Parameter.create!( parameter_attributes.merge( :method_id => method.id ) )
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
