class Post < ActiveRecord::Base
  belongs_to :users
  has_and_belongs_to_many :tags
  validates :title, :presence => true
  validates :author, :presence => true
  validates :body, :presence => true
end