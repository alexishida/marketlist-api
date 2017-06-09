class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, limit: 50
      t.integer :quantity
      t.boolean :found

      t.timestamps
    end
  end
end
