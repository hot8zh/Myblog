class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles,:options=>"charset=utf8" do |t|
      t.string :title
      t.text :content
      t.integer :visited_count,:default=>0
      t.integer :comments_count,:default=>0
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
