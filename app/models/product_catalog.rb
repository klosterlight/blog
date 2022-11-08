class ProductCatalog < ApplicationRecord
  include Filterable

  validates :name, uniqueness: true, presence: true

  has_many :labels
  has_many :product_catalog_labels, through: :labels

  scope :by_is_active, -> (is_active) do
    where(is_active: is_active)
  end
end
