namespace :db do

  task :environment do
    require File.join( File.expand_path( File.dirname( __FILE__ ) + "/../.." ), 'config', 'environment' )
  end

  desc "Run migrations in db/migrate"
  task :migrate => :environment do
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    ActiveRecord::Migrator.migrate( 'db/migrate/', ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
  end

end
