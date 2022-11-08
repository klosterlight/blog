class ProductCatalog < ApplicationRecord
  include Filterable

  validates :name, uniqueness: true, presence: true

  has_many :product_catalog_labels
  has_many :labels, through: :product_catalog_labels

  accepts_nested_attributes_for :product_catalog_labels

  scope :by_is_active, -> (is_active) do
    where(is_active: is_active)
  end
end
