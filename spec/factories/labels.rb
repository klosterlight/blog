FactoryBot.define do
  factory :label do
    name { FFaker::Animal.common_name }
    color { FFaker::Color.name }
  end
end
