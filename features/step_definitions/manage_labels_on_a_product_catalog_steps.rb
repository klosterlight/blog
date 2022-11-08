Given('That I\'m logged as an admin') do
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

