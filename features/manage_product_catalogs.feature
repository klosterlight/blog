Feature: A user can manage a product_catalog

Scenario: The user gets all the product_catalogs
  Given That I have 10 product_catalogs created
  When I GET all the /product_catalogs
  Then I should receive 200 status
    And I should get the 10 product_catalogs

Scenario: The user gets a single product_catalog
  Given That I have 1 product_catalogs created
  When I GET a single /product_catalog
  Then I should receive 200 status
    And I should get the product_catalog

Scenario: The user tries to get a single product_catalog but does not exist
  Given That I have 1 product_catalogs created
  When I GET a single /product_catalog that does not exist
  Then I should receive 404 status
    And I should get an error message "Couldn't find ProductCatalog with 'id'=0"

Scenario: The user creates a new product_catalog
  Given That I have 3 labels created
  When I POST a new /product_catalogs with name "Shalala"
  Then I should receive 201 status
    And I should have a new product_catalog

Scenario: The user tries to create a new product_catalog but the name is being used
  Given That I have a product_catalog with name "Machu Pichu"
  When I POST a new /product_catalogs with name "Machu Pichu"
  Then I should receive 422 status
    And I should get an error message "Name has already been taken"

Scenario: The user tries to create a new product_catalog but the name is empty
  Given That I have a product_catalog with name "Machu Pichu"
  When I POST a new /product_catalogs with name ""
  Then I should receive 422 status
    And I should get an error message "Name can't be blank"

Scenario: The user updates a product_catalog

Scenario: The user tries to update a new product_catalog but the name is being used

Scenario: The user tries to update a new product_catalog but the name is empty

Scenario: The user gets only active product_catalogs
