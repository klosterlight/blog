require 'rails_helper'

RSpec.describe Label, type: :model do
  subject {
    FactoryBot.build(:label)
  }

  describe 'associations' do
    it { should have_many(:product_catalog_labels) }
    it { should have_many(:product_catalogs).through(:product_catalog_labels) }
  end

  describe 'validations' do
  end
end
