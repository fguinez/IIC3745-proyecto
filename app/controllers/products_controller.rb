class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  # GET products/new
  def new
    @product = Product.new
  end 

  # POST products/new
  def create
    @product = Product.new(category: params[:category], price: params[:price], weight: params[:weight], volume: params[:volume])
    if @product.save
      redirect_to '/product/new', notice: 'producto creada con exito'
    else
      redirect_to '/product/new', notice: @product.errors.messages
    end
  end

  def read
  end

  def update
    # product_params = params.require(:price, :category).permit(:weight, :volume)
    # @product = Product.find(params[:id])

    # if @product.persisted?
    #   if @product.update(product_params)
    #     redirect_to product_path(@product) , notice 'Producto actualizado con exito'
    #   else
    #     redirect_to '/product/new', notice: product.errors.message
    #   end
    # else
    #   redirect_to '/product/new', notice: product.errors.message
    # end
  end

  def delete
    @product.delete
    redirect_to redirect_to '/product/new', notice: 'producto eliminado con exito'

  end
    
end
