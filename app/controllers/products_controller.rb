# frozen_string_literal: true

# Controler that manages all actions related to product CRUD
class ProductsController < ApplicationController
  def index
    @checkbox = { Bebestible: false, Comestibles: false, Souvenir: false }
    if params[:Bebestible] || params[:Comestibles] || params[:Souvenir]
      @products = []
      if params[:Bebestible]
        @checkbox[:Bebestible] = true
        @products.push(*Product.where(category: 'Bebestible'))
      end
      if params[:Comestibles]
        @checkbox[:Comestibles] = true
        @products.push(*Product.where(category: 'Comestibles'))
      end
      if params[:Souvenir]
        @checkbox[:Souvenir] = true
        @products.push(*Product.where(category: 'Souvenir'))
      end
    else
      @checkbox = { Bebestible: true, Comestibles: true, Souvenir: true }
      @products = Product.all
    end
  end

  # POST products/new
  def create
    name = params[:name]
    category = params[:category]
    price = params[:price]
    weight = params[:weight]
    volume = params[:volume]

    @product = Product.new(name:, price:, category:, weight:, volume:)
    if @product.save
      redirect_to '/products/new', notice: 'producto creada con exito'
    else
      redirect_to '/products/new', notice: @product.errors.messages
    end
  end

  def update
    @product = Product.find(params[:id])
  rescue StandardError
    redirect_to '/products/index', notice: 'Este producto no existe'
  end

  def send_changes
    name = params[:name]
    category = params[:category]
    price = params[:price]
    weight = params[:weight]
    volume = params[:volume]

    @product = Product.find(params[:id])

    if @product.update(name:, price:, category:, weight:, volume:)
      redirect_to '/products/index', notice: 'Producto se actualizó con exito'
    else
      redirect_to product_edit_path(id: params[:id]), notice: @product.errors.messages
    end
  end

  def delete
    Product.destroy(params[:id])
    redirect_to '/products/index', notice: 'Producto eliminado con exito'
  end
end
