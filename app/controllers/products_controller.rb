class ProductsController < ApplicationController 
  before_action :find_product, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @products = Product.all
  end 

  def show
  end 

  def new 
    @product = Product.new 
  end 

  def create 
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else 
      render :new 
    end 
  end 

  def edit 
  end 

  def update
    if @product.update(product_params)
      redirect_to products_path
    else 
      render :edit 
    end 
  end 

  def destroy 
    @product.destroy 
    redirect_to products_path
  end 

  private 
  def product_params
    params.require(:product).permit(:name, 
                                    :status, 
                                    :description, 
                                    :list_price,
                                    :sell_price,
                                    :SKU )
  end 

  def find_product 
    @product = Product.find(params[:id])
  end 
end 