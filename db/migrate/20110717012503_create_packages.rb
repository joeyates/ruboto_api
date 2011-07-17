class CreatePackages < ActiveRecord::Migration

  def self.up
    create_table :packages do | t |
      t.string     :name
      t.integer    :api_added,   :default => 1
      t.integer    :api_removed, :null => true
      t.integer    :deprecated,  :null => true
      t.timestamps
    end

    add_index :packages, :name
  end

  def self.down
    remove_index :packages, :name
    drop_table   :packages
  end

end
