namespace :ruboto do

  desc "Import android XML API file"
  task :import => :environment do
    File.open( ANDROID_API_XML ) do | file |
      @doc = Nokogiri::XML( file )
    end
    ActiveRecord::Base.transaction do
      Ruboto::Api::Package.destroy_all
      @doc.xpath( '/api/package' ).each do | package_element |
        Ruboto::Api::Package.import( package_element )
      end
    end
  end

end
