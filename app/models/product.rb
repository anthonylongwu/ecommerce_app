class Product < ActiveRecord::Base
  belongs_to :supplier

  has_many :images

  belongs_to :model

  has_many :orders
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products
  has_many :orders through: :carted_products

  
  

  # validates :name, :price, :description, presence: true 


  def sale_message   
      if price.to_i < 50
        return "Discount Item!"
      else 
       return "On sale!"
     end
  end


  def tax
    tax_price = price.to_i * (0.09)
    puts tax_price
    return tax_price
  end

  def total
    total_price = price.to_i + tax
    return total_price
  end
end
