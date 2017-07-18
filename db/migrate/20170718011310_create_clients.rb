class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :firstName
      t.string :lastName
      t.string :phone
      t.string :address
      t.integer :zipcode
    end
  end
end
