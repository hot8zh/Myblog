class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments,:options=>"charset=utf8" do |t|
      t.string :title
      t.text :content
      t.string :user_name
      t.integer :article_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
