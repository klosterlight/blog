class ProductCatalogLabel < ApplicationRecord
  belongs_to :product_catalog
  belongs_to :label

  accepts_nested_attributes_for :label
end
