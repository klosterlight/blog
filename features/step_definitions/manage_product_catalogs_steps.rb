Given('That I have {int} product_catalogs created') do |amount|
  @product_catalogs = FactoryBot.create_list :product_catalog, amount
end

Given('That I have a product_catalog with name {string}') do |name|
  @product_catalog = FactoryBot.create :product_catalog, name: name
end

# TODO: Implement this!
Given('That I have {int} labels created') do |amount|
end

When('I GET all the \/product_catalogs') do
  get product_catalogs_path
  @response_data = JSON.parse(last_response.body)
end

When('I GET a single \/product_catalog') do
  get(product_catalog_path(@product_catalogs.first))
  @response_data = JSON.parse(last_response.body)
end

When('I GET a single \/product_catalog that does not exist') do
  get(product_catalog_path(0))
  @response_data = JSON.parse(last_response.body)
end

When('I POST a new \/product_catalogs with name {string}') do |name|
  product_catalog_params = {
    product_catalog: FactoryBot.attributes_for(:product_catalog, name: name)
  }
  post(product_catalogs_path, product_catalog_params)
  @response_data = JSON.parse(last_response.body)
end

When('I PUT a \/product_catalogs\/:id with name {string}') do |name|
  product_catalog_params = {
    product_catalog: {
      name: name
    }
  }
  put(product_catalog_path(@product_catalog), product_catalog_params)
  @response_data = JSON.parse(last_response.body)
end

Then('I should receive {int} status') do |http_status|
  expect(last_response.status).to eq http_status
end

Then('I should get the {int} product_catalogs') do |amount|
  expect(@response_data.count).to eq amount
  expect(@product_catalogs.map(&:id)).to match_array @response_data.map { |e| e["id"] }
end

Then('I should get the product_catalog') do
  expect(@response_data["id"]).to eq @product_catalogs[0].id
  expect(@response_data["name"]).to eq @product_catalogs[0].name
  expect(@response_data["is_active"]).to eq @product_catalogs[0].is_active
end

Then('I should get an error message {string}') do |error_message|
  expect(@response_data["messages"][0]).to eq error_message
end

Then('I should have a new product_catalog') do
  expect(@response_data["id"]).to be
end

Then('The product_catalog should have name {string}') do |name|
  expect(@response_data["name"]).to eq name
end
