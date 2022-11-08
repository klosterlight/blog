class ProductCatalogLabel < ApplicationRecord
  belongs_to :product_catalog
  belongs_to :label
end
