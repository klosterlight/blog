class Label < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :product_catalog_labels
  has_many :product_catalogs, through: :product_catalog_labels
end
