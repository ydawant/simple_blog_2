class Post < ActiveRecord::Base
  has_many :post_tags
  has_many :tags, :through => :post_tags
  validates :title, :presence => true
  validates :author, :presence => true
  validates :body, :presence => true

end
