class Comment < ActiveRecord::Base
  belongs_to :article,:counter_cache=>true

  validates_presence_of :user_name,:title,:content
end
