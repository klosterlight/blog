FactoryBot.define do
  factory :product_catalog do
    sequence(:name) { |n| "#{FFaker::Name.name}_#{n}" }
    description { FFaker::Lorem.phrase }
    is_active { true }
  end
end
