class ProductCatalogsController < ApplicationController
  before_action :find_product_catalog, only: [:show]

  def index
    @product_catalogs = ProductCatalog.all
    render json: @product_catalogs, status: 200
  end

  def show
    render json: @product_catalog
  end

  private

  def find_product_catalog
    @product_catalog = ProductCatalog.find params[:id]
  end
end
