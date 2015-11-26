class ChangePriceToInteger < ActiveRecord::Migration
  def change
    change_column :products, :price, 'integer USING price::numeric(10,2)'
  end
end
