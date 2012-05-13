class CreateMenuItems < ActiveRecord::Migration
  def self.up
    create_table :menu_items do |t|      
      t.integer :position
      t.integer :parent_id, :null => true, :default => nil
      t.string :label
      t.string :page_id
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :menu_items
  end
end
