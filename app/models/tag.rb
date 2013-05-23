class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts
  validates :name, :presence => true

  def self.from_string(string)
    string.gsub(/\s+/, "") \
          .split(',') \
          .map { |tag| Tag.find_or_create_by_name(tag)}
  end
end
