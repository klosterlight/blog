Given('That I\'m logged as an admin') do
end

When('I POST a new \/product_catalogs with label {string}') do |label_name|
  @product_catalog_params = {
    product_catalog: FactoryBot.attributes_for(:product_catalog)
  }
  @product_catalog_params["labels"] = [
    {
      name: label_name
    }
  ]

  post product_catalogs_path, @product_catalog_params
  @response_data = JSON.parse(last_response.body)
end

Then('I should have one product_catalog_labels') do
  expect(ProductCatalogLabel.count).to eq 1
end

Then('I should have a new label with name {string}') do |label_name|
  expect(Label.count).to eq 1
  expect(Label.first.name).to eq label_name
end
