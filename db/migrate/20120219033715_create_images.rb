class CreateImages < ActiveRecord::Migration
  def up
    create_table :images do |t|
      t.string :image
      t.timestamps
    end
  end

  def down
    drop_table :images
  end
end
