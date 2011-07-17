# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110717012503) do

  create_table "klasses", :force => true do |t|
    t.string   "name"
    t.boolean  "final"
    t.string   "extends"
    t.string   "visibility",  :default => "public"
    t.boolean  "static",      :default => false
    t.boolean  "abstract",    :default => false
    t.integer  "api_added",   :default => 1
    t.integer  "api_removed"
    t.integer  "deprecated"
    t.integer  "package_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "klasses", ["name"], :name => "index_klasses_on_name"

  create_table "methods", :force => true do |t|
    t.string   "name"
    t.string   "return"
    t.string   "visibility",   :default => "public"
    t.boolean  "final",        :default => false
    t.boolean  "static",       :default => false
    t.boolean  "abstract",     :default => false
    t.boolean  "synchronized", :default => false
    t.boolean  "native",       :default => false
    t.integer  "api_added",    :default => 1
    t.integer  "api_removed"
    t.integer  "deprecated"
    t.integer  "klass_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "methods", ["klass_id"], :name => "index_methods_on_klass_id"

  create_table "packages", :force => true do |t|
    t.string   "name"
    t.integer  "api_added",   :default => 1
    t.integer  "api_removed"
    t.integer  "deprecated"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "packages", ["name"], :name => "index_packages_on_name"

  create_table "parameters", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "method_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parameters", ["method_id"], :name => "index_parameters_on_method_id"

end
