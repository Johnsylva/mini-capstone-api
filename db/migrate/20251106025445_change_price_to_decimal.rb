class ChangePriceToDecimal < ActiveRecord::Migration[8.1]
  def change
    change_column :products, :price, :decimal, precision: 6, scale: 2
  end

  def change
    add_column :products, :inventory, :integer
  end
end
