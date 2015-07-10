class Preset < ActiveRecord::Base
  belongs_to :user
  has_many :products, dependent: :destroy

  validates :title, presence: true
  validates :user, presence: true
  
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
