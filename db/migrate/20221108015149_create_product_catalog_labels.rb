class CreateProductCatalogLabels < ActiveRecord::Migration[7.0]
  def change
    create_table :product_catalog_labels do |t|
      t.references :product_catalog, null: false, foreign_key: true
      t.references :label, null: false, foreign_key: true

      t.timestamps
    end
  end
end
