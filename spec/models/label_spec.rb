require 'rails_helper'

RSpec.describe Label, type: :model do
  subject {
    FactoryBot.build(:label)
  }

  describe 'associations' do
    it { should have_many(:product_catalogs) }
    it { should belong_to(:product_catalog_labels) }
  end

  describe 'validations' do
  end
end
