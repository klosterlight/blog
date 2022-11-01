class CreateProductCatalogs < ActiveRecord::Migration[7.0]
  def change
    create_table :product_catalogs do |t|
      t.string :name, null: false, default: ""
      t.text :description

      t.timestamps
    end
    add_index :product_catalogs, :name, unique: true
  end
end
