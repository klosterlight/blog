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
    And I should have 1 product_catalog_labels
    And I should have a new label with name "hip-hop"

Scenario: A user adds 3 new labels when creating a new product
  Given That I'm logged as an admin
  When I POST a new /product_catalogs with labels "hip-hop", "rap", "trap"
  Then I should receive 201 status
    And I should have a new product_catalog
    And I should have 3 product_catalog_labels
    And I should have a three new labels with names "hip-hop", "rap", "trap"

Scenario: A user adds a new label when updating an existing product
  Given That I have a product_catalog with name "Canserbero"
  When I PUT a /product_catalogs/:id with label "rap"
    And I should have 1 product_catalog_labels
    And I should have a new label with name "rap"

Scenario: A user adds an existing label when creating a new product
  Given That I have a label with name 'rap'
  When I POST a new /product_catalog with existing label
  Then I should receive 201 status
    And I should have a new product_catalog
    And I should have a new label with name 'rap'
    And I should have 1 product_catalog_labels

Scenario: A user changes labels for an existing product

Scenario: A user adds 4 labels when creating a new product

Scenario: A user adds the same label when updating a new product

Scenario: A user adds a new product without labels
