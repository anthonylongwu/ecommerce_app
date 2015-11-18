class Product < ActiveRecord::Base

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
