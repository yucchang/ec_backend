class Product < ApplicationRecord
  validates :name, :status, presence: true 
  validates :list_price, :sell_price, :SKU, numericality: { greater_than: 0 }

  has_many_attached :images
  
  enum status: { unreleased: 0, processing: 1, released: 2}
end
