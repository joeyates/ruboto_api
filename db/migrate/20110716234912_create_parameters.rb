class CreateParameters < ActiveRecord::Migration

  def self.up
    create_table :parameters do | t |
      t.string     :name
      t.string     :type
      t.references :method
      t.timestamps
    end

    add_index :parameters, :method_id
  end

  def self.down
    remove_index :parameters, :method_id
    drop_table   :parameters
  end

end
