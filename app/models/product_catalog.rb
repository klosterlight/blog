class ProductCatalog < ApplicationRecord
  validates :name, uniqueness: true
end
