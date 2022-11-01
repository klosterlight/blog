class ProductCatalogsController < ApplicationController
  def index
    @product_catalogs = ProductCatalog.all
    render json: @product_catalogs, status: 200
  end
end
