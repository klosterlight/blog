class Label < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :product_catalogs
  has_many :product_catalog_labels, through: :product_catalogs
end
