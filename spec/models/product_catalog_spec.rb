require 'rails_helper'

RSpec.describe ProductCatalog, type: :model do
  subject {
    FactoryBot.build(:product_catalog)
  }

  describe 'associations' do
    it { should have_many(:product_catalog_labels) }
    it { should have_many(:labels).through(:product_catalog_labels) }
  end

  describe 'validations' do
  end
end
