class Api::V1::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products, status: 200
  end

  def create
    product = Product.new(
      name: prod_params[:name],
      brand: prod_params[:brand],
      price: prod_params[:price],
      description: prod_params[:description]
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

  def edit # update product#
    product = Product.find_by(id: params[:id])
    if product
      product = Product.update(
        name: prod_params[:name],
        brand: prod_params[:brand],
        price: prod_params[:price],
        description: prod_params[:description]
      )
      if product.save
        render json: product , status: 200
      else
        render json: { :error => "error 666" }
      end
    end
  end

  def delete ## Delete Product##
    product = Product.find_by(id: params[:id])
    if product
      Product.delete
      if product.delete
        render json: product , status: 200
      else
        render json: { :error => "Product no Found" }
      end
    end
  end


  def count ##Count the total of product
    product = Product.count
    render json: product, status: 200


  end

  def move_product
  end

  private
  def prod_params
    params.require(:product).permit([
      :name,
      :brand,
      :price,
      :description
                                    ])
  end
end
