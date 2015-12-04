class Order < ActiveRecord::Base
  belongs_to :model
  has_many :carted_products
  has_many :products, through: :carted_products

  # validates :model, :user_id, :product, :price, presence: true 

  # validate :quantity_must_be_5

  def quantity_must_be_5
    if quantity != 5
      errors.add(:quantity,"you need only input 5.")
    end
  end



end
