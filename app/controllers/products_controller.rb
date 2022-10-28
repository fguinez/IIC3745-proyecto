# frozen_string_literal: true

# Controler that manages all actions related to product CRUD
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
    category = params[:category]
    price = params[:price]
    weight = params[:weight]
    volume = params[:volume]

    @product = Product.new(price:, category:, weight:, volume:)
    if @product.save
      redirect_to '/product/new', notice: 'producto creada con exito'
      puts 'kee'
    else
      redirect_to '/product/new', notice: @product.errors.messages
      puts 'noo'
    end
    puts 'finnnn'
  end

  def read; end

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
