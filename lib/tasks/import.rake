namespace :ruboto do

  desc "Import android XML API file"
  task :import => :environment do
    raise "Missing ANDROID_API_XML parameter"                       if   ENV[ 'ANDROID_API_XML' ].nil?
    raise "The file '#{ ENV[ 'ANDROID_API_XML' ] }' does not exist" if ! File.exist?( ENV[ 'ANDROID_API_XML' ] )
    File.open( ENV[ 'ANDROID_API_XML' ] ) do | file |
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
