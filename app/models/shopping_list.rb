class ShoppingList < ActiveRecord::Base
  belongs_to :user
  belongs_to :buyer, class_name: "User"
  has_many :products, dependent: :destroy

  mount_uploader :image, ShoppingListImageUploader
  
  validates :title, presence: true
  validates :user, presence: true

  default_scope { order('updated_at DESC') }
  scope :bought, lambda { where(was_bought: true) }
  scope :un_bought, lambda { where(was_bought: false) }
end
