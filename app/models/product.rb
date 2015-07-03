class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :shopping_list
  has_one :measure

  mount_uploader :image, ProductImageUploader
end
