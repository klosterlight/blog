class ProductCatalog < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
