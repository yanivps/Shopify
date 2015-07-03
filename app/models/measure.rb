class Measure < ActiveRecord::Base
  enum unit: [ :other, :units, :grams, :kilograms, :mililiters, :liters ]
  belongs_to :product
end
