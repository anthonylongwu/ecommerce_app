class ChangePriceOfProducts < ActiveRecord::Migration
  def change
    change_column :products, :price, 'numeric USING price::numeric(6,2)'
  end
end
