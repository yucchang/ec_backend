class Admin::ProductsController < ApplicationController
  before_action :find_product, except: [:index, :new]
  before_action :authenticate_user!

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
      redirect_to admin_products_path, notice: 'Product is created.'
    else 
      render :new 
    end 
  end 

  def edit 
  end 

  def update
    if @product.update(product_params) 
      redirect_to admin_products_path 
    else 
      render :edit 
    end 
  end 

  def destroy 
    @product.destroy 
    redirect_to admin_products_path, notice: 'Product is removed.'
  end 

  def remove_image 
    @product.images.find(params[:format]).purge
    render :edit
  end

  private 
  def product_params
    params.require(:product).permit(:name, 
                                    :status, 
                                    :description, 
                                    :list_price,
                                    :sell_price,
                                    :SKU,
                                    images:[])
  end 

  def find_product 
    @product = Product.find(params[:id])
  end  
end
