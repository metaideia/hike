class AddEmailNameToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :name_from, :string
  end
end
