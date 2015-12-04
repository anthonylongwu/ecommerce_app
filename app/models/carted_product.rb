class CartedProduct < ActiveRecord::Base
  belongs_to :model
  belongs_to :product 
  belongs_to :order

validates :quantity, numericality: true
end
