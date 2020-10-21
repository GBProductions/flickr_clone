class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :tags
  validates :description, :image, :presence => true
end
