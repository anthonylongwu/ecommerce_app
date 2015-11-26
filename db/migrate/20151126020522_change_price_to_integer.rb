class ChangePriceToInteger < ActiveRecord::Migration
  def change
    change_column :products, :price, 'integer USING (trim(price)::integer)'
  end
end
