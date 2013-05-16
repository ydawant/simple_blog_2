class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, :through => :post_tags
  validates :name, :presence => true

  def self.from_string(string)
    string.gsub(/\s+/, "") \
          .split(',') \
          .map { |tag| Tag.find_or_create_by_name(tag)}
  end
end
