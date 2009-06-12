class CreateAutosaveArticles < ActiveRecord::Migration
  def self.up
    create_table :autosave_articles,:options=>"charset=utf8" do |t|
      t.string :name
      t.string :articles_id

      t.timestamps
    end
  end

  def self.down
    drop_table :autosave_articles
  end
end
