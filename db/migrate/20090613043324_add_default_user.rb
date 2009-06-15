class AddDefaultUser < ActiveRecord::Migration
  def self.up
    User.create(:name=>"admin",:password=>"admin")
  end

  def self.down
  end
end
