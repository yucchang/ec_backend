class ProductsController < ApplicationController 
  before_action :find_product, only: [:show]

  layout 'frontend'

  def index
    @products = Product.released 
  end 

  def show
  end 

  private
  def find_product 
    @product = Product.find(params[:id])
  end 
end 