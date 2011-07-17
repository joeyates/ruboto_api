class CreateMethods < ActiveRecord::Migration

  def self.up
    create_table :methods do | t |
      t.string     :name
      t.string     :return
      t.string     :visibility,   :default => 'public'
      t.boolean    :final,        :default => false
      t.boolean    :static,       :default => false
      t.boolean    :abstract,     :default => false
      t.boolean    :synchronized, :default => false
      t.boolean    :native,       :default => false
      t.integer    :api_added,    :default => 1
      t.integer    :api_removed,  :null => true
      t.integer    :deprecated,   :null => true
      t.references :klass
      t.timestamps
    end

    add_index :methods, :klass_id
  end

  def self.down
    remove_index :methods, :klass_id
    drop_table   :methods
  end

end
