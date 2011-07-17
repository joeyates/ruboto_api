require 'erb'
require 'yaml'
require 'active_record'
require 'sqlite3'
require 'nokogiri'
require 'fileutils'

RUBOTO_API_ROOT = File.expand_path( File.dirname( __FILE__ ) + '/..' )
$:.unshift File.join( RUBOTO_API_ROOT, 'lib' )

RUBOTO_API_ENV   = 'development' unless defined?( RUBOTO_API_ENV )
ANDROID_SDK_ROOT = '/home/joe/code/android'
RUBOTO_CORE_ROOT = '/home/joe/code/android/ruboto-core'
ANDROID_API_XML  = "#{ RUBOTO_CORE_ROOT }/lib/java_class_gen/android_api.xml"

def database_configuration
  database_yml = File.join( File.dirname( __FILE__ ) , 'database.yml' )
  YAML::load( ERB.new( IO.read( database_yml ) ).result )
end

ActiveRecord::Base.configurations = database_configuration
ActiveRecord::Base.establish_connection ActiveRecord::Base.configurations[ RUBOTO_API_ENV ]

require 'ruboto/api'
require 'ruboto/api/models'
