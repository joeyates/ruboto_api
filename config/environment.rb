require File.expand_path('../application', __FILE__)

RubotoApi::Application.initialize!

ANDROID_SDK_ROOT = '/home/joe/code/android'
RUBOTO_CORE_ROOT = '/home/joe/code/android/ruboto-core'
ANDROID_API_XML  = "#{ RUBOTO_CORE_ROOT }/lib/java_class_gen/android_api.xml"

require 'nokogiri_helper'
