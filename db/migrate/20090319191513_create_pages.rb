class CreatePages < ActiveRecord::Migration
  def self.up

    create_table :pages do |t|      
      t.string  :url_tag, :title, :html_title, :keywords, :description
      t.text    :content
      t.boolean :published
      t.timestamps      
    end
    add_index :pages, :url_tag

  end

  def self.down
    drop_table :pages    
  end
end
