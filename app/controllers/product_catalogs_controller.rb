class ProductCatalogsController < ApplicationController
  before_action :find_product_catalog, only: [:show, :update]

  def index
    @product_catalogs = ProductCatalog.all.filter_results(params.slice(:by_is_active))
    render json: @product_catalogs, status: 200
  end

  def show
    render json: @product_catalog
  end

  def create
    @product_catalog = ProductCatalog.new product_catalog_params
    if @product_catalog.save
      render json: @product_catalog, status: 201
    else
      render json: { messages: @product_catalog.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @product_catalog.update product_catalog_params
      render json: @product_catalog, status: 200
    else
      render json: { messages: @product_catalog.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def product_catalog_params
    params.require(:product_catalog).permit(:name, :description, :is_active)
  end

  def find_product_catalog
    @product_catalog = ProductCatalog.find params[:id]
  end
end
