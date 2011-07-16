module Ruboto

  class Api

    def initialize
      connect
    end

    def load
      File.open( File.expand_path( ANDROID_API ) ) do | file |
        @doc = Nokogiri::XML( file )
      end
    end

    def doc
      @doc if @doc
      load
      @doc
    end

    def each_class
      classes = doc.xpath( '/api/package/class' )
      classes = classes[0 .. 5]
      classes.each do | klass |
        yield klass
      end
    end

    def import
      ActiveRecord::Base.connection.execute( 'delete from parameters;' )
      ActiveRecord::Base.connection.execute( 'delete from methods;' )
      ActiveRecord::Base.connection.execute( 'delete from classes;' )
      each_class do | klass |
        
      end
    end

    private

  end

end
