class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :status

      t.timestamps
    end
  end
end
