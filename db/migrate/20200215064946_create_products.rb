class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :status, default: "unreleased"
      t.decimal :list_price
      t.decimal :sell_price
      t.integer :SKU

      t.timestamps
    end
  end
end
