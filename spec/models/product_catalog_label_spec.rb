require 'rails_helper'

RSpec.describe ProductCatalogLabel, type: :model do
  subject {
    FactoryBot.build(:product_catalog_label)
  }

  describe 'associations' do
    it { should belong_to(:product_catalog) }
    it { should belong_to(:label) }
  end

  describe 'validations' do
  end
end
