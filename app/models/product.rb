class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :shopping_list
  belongs_to :preset
  has_one :measure, validate: true

  mount_uploader :image, ProductImageUploader

  validates :title, presence: true
  validates :user, presence: true
  validates :measure, presence: true

end
