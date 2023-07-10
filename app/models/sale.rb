class Sale < ApplicationRecord
  belongs_to :album
  belongs_to :order
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
