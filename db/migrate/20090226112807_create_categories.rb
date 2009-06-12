class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories,:options=>"charset=utf8" do |t|
      t.string :name
      t.integer :articles_count,:default=>0

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
