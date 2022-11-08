FactoryBot.define do
  factory :product_catalog_label do
    product_catalog { build(:product_catalog) }
    label { build(:label) }
  end
end
