class ShoppingList < ActiveRecord::Base
  belongs_to :user
  has_many :products

  mount_uploader :image, ShoppingListImageUploader
end
