class CreateMethods < ActiveRecord::Migration

  def self.up
    create_table :methods do | t |
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :methods
  end

end
