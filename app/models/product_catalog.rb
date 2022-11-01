class ProductCatalog < ApplicationRecord
  include Filterable

  validates :name, uniqueness: true, presence: true

  scope :by_is_active, -> (is_active) do
    where(is_active: is_active)
  end
end
