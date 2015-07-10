class Measure < ActiveRecord::Base
  enum unit: [ :other, :items, :grams, :kilograms, :mililiters, :liters ]
  belongs_to :product

  validates :quantity, presence: true
end
