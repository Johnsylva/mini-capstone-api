class ChangeDescriptionToText < ActiveRecord::Migration[8.1]
  def change
    change_column :products, :description, :text
  end
end
