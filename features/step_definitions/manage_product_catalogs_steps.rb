Given('That I have {int} product_catalogs created') do |amount|
  @product_catalogs = FactoryBot.create_list :product_catalog, amount
end

When('I GET all the \/product_catalogs') do
  get product_catalogs_path
  @response_data = JSON.parse(last_response.body)
end

When('I GET a single \/product_catalog') do
  get(product_catalog_path(@product_catalogs.first))
  # get "/product_catalogs/#{@product_catalogs.first.id}"
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
