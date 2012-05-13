class CreatePageVersions < ActiveRecord::Migration
  def up
    Page.create_versioned_table
  end

  def down
    drop_table :page_versions
  end
end
