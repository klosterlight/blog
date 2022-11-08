Given('That I\'m logged as an admin') do
end

Given('That I have a label with name {string}') do |label_name|
  @label = FactoryBot.create :label, name: label_name
end

Given('That I have a product_catalog with name {string} with labels {string}, {string}') do |product_catalog_name, label_0, label_1|
  @product_catalog = FactoryBot.create :product_catalog, name: product_catalog_name, product_catalog_labels_attributes: [
    {
      label_attributes: FactoryBot.attributes_for(:label, name: label_0)
    },
    {
      label_attributes: FactoryBot.attributes_for(:label, name: label_1)
    }
  ]
end

Given('I want to remove label {string} and the new label and create a new label {string}') do |label_0, label_1|
  product_catalog_label =
    @product_catalog
    .product_catalog_labels
    .joins(:label)
    .where("labels.name = ?", label_0)
    .first
  @product_catalog_params = {
    product_catalog: {
      product_catalog_labels_attributes: [
        {
          id: product_catalog_label.id,
          _destroy: true
        },
        {
          label_attributes: FactoryBot.attributes_for(:label, name: label_1)
        },
        {
          label_id: @label.id
        }
      ]
    }
  }
  binding.pry
end

When('I POST a new \/product_catalogs with label {string}') do |label_name|
  @product_catalog_params = {
    product_catalog: FactoryBot.attributes_for(:product_catalog)
  }
  @product_catalog_params[:product_catalog][:product_catalog_labels_attributes] = [
    {
      label_attributes: {
        name: label_name,
        color: "red"
      }
    }
  ]

  post product_catalogs_path, @product_catalog_params
  @response_data = JSON.parse(last_response.body)
end

When('I POST a new \/product_catalogs with labels {string}, {string}, {string}') do |label_0, label_1, label_2|
  @product_catalog_params = {
    product_catalog: FactoryBot.attributes_for(:product_catalog)
  }
  @product_catalog_params[:product_catalog][:product_catalog_labels_attributes] = [
    {
      label_attributes: {
        name: label_0,
        color: "red"
      }
    },
    {
      label_attributes: {
        name: label_1,
        color: "yellow"
      }
    },
    {
      label_attributes: {
        name: label_2,
        color: "black"
      }
    }
  ]

  post product_catalogs_path, @product_catalog_params
  @response_data = JSON.parse(last_response.body)
end

When('I PUT a \/product_catalogs\/:id with label {string}') do |label_name|
  put product_catalog_path(@product_catalog), {
    product_catalog: {
      product_catalog_labels_attributes: [
        {
          label_attributes: {
            name: label_name,
            color: "blue"
          }
        }
      ]
    }
  }

  @response_data = JSON.parse(last_response.body)
end

When('I POST a new \/product_catalog with existing label') do
  @product_catalog_params = {
    product_catalog: FactoryBot.attributes_for(:product_catalog)
  }
  @product_catalog_params[:product_catalog][:product_catalog_labels_attributes] = [
    {
      label_id: @label.id
    }
  ]

  post product_catalogs_path, @product_catalog_params
  @response_data = JSON.parse(last_response.body)
end

When('I PUT a \/product_catalogs\/:id') do
  put product_catalog_path(@product_catalog), @product_catalog_params
  @response_data = JSON.parse(last_response.body)
end

Then('I should have {int} product_catalog_labels') do |amount|
  expect(ProductCatalogLabel.count).to eq amount
end

Then('I should have a new label with name {string}') do |label_name|
  expect(Label.count).to eq 1
  expect(Label.first.name).to eq label_name
end

Then('I should have a three new labels with names {string}, {string}, {string}') do |label_0, label_1, label_2|
  expect(Label.count).to eq 3
  expect(Label.all.map(&:name)).to match_array([label_0, label_1, label_2])
end

Then('I should have labels {string}, {string}, {string} associated to the product_catalog') do |existing_associated_label_name, existing_label_name, new_label_name|
  @product_catalog.reload
  binding.pry
  expect(@product_catalog.labels.map(&:name)).to match_array [existing_associated_label_name, existing_label_name, new_label_name]
end

Then('I should have a {int} new labels') do |amount|
  expect(Label.count).to eq amount
end
