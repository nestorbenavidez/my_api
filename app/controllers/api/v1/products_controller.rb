class Api::V1::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products, status: 200
  end
  def create
    product = Product.new(
      name:prod_params[:name],
      brand: prod_params[:brand],
      price: prod_params[:price],
      description: prod_params[:description],
      shop_id: prod_params[:shop_id]
    )
    if product.save
      render json: product, status: 200
    else
      render json: {error: "Error creating product"}
    end
  end

  def show
    product = Product.find_by(id: params[:id])
    if product
      render json: product, status: 200
    else
      render json: {error: "Product not found"}
    end
  end
  def edit # update product
    product = Product.find_by(id: params[:id])
    if product.update(prod_params)
      render json: product, status: 200
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  def delete ## Delete Product###
    product = Product.find_by(id: params[:id])
    if product
      if product.delete!
        render json: product , status: 200
      else
        render json: { :error => "Product no Found" }
      end
    end
  end

  def count ##Count the total of product##
    product = Product.count
    render json: product, status: 200
  end

  def move_product
    product = Product.find_by(id: params[:id])
    if product.update(shop_id: params[:shop_id])
      render json: product, status: 200
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  private
  def prod_params
    params.require(:product).permit([
      :name,
      :brand,
      :price,
      :description,
      :shop_id,
      ])
  end
end
