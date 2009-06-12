class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :category,:counter_cache=>true
  belongs_to :user,:counter_cache=>true

  validates_presence_of :title
end
