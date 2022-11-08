Feature: The user can manage the labels on a product
  A product can have at most 3 labels
  A product cannot have more the one of the same label
  A product should have at least one label
  Removing a label from the product does not remove the label
  The system should create a new label when creating a new product
  if the label does not exist

Scenario: A user adds a new label when creating a new product
  Given That I'm logged as an admin
  When I POST a new /product_catalogs with label "hip-hop"
  Then I should receive 201 status
    And I should have a new product_catalog
    And I should have one product_catalog_labels
    And I should have a new label with name "hip-hop"

Scenario: A user adds a new label when updating an existing product

Scenario: A user adds an existing label when creating a new product

Scenario: A user adds an existing label when updating a new product

Scenario: A user adds 4 labels when creating a new product

Scenario: A user adds the same label when updating a new product

Scenario: A user adds a new product without labels
