class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :shopping_list
  belongs_to :preset
  has_one :measure

  mount_uploader :image, ProductImageUploader

  validates :title, presence: true
end
