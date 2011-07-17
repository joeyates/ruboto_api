class CreateKlasses < ActiveRecord::Migration

  def self.up
    create_table :klasses do | t |
      t.string     :name
      t.boolean    :final
      t.string     :extends
      t.boolean    :visibility,  :default => 'public'
      t.boolean    :static,      :default => false
      t.boolean    :abstract,    :default => false
      t.integer    :api_added,   :default => 1
      t.integer    :api_removed, :null => true
      t.integer    :deprecated,  :null => true
      t.references :package
      t.timestamps
    end

    add_index :klasses, :name
  end

  def self.down
    remove_index :klasses, :name
    drop_table   :klasses
  end

end
