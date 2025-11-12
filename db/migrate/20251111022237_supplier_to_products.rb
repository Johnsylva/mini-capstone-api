class SupplierToProducts < ActiveRecord::Migration[8.1]
  def change
    add_column :products, :supplier_id, :integer
  end
end
