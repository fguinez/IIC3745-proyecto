class ProductsController < ApplicationController

  def create
    product_params = params.require(:price).require(:category).permit(:weight, :volume)
    @product = Product.new(product_params)
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
  end
end
