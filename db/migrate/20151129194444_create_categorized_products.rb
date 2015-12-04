class CreateCagetorizedProducts < ActiveRecord::Migration
  def change
    create_table :categorized_products do |t|

      t.timestamps null: true
    end
  end
end
