class CartsController < ApplicationController
  before_action :load_cart
  after_action :write_cart, only: [:add_product, :update_product, :remove_product]

  def show
    @products = []
    @cart.each do |product_id, quantity|
      product = Product.find_by(id: product_id)
      product.define_singleton_method(:quantity) do
        quantity
      end
      @products << product
    end
  end

  def add_product
    if @cart[params[:id]]
      quantity = params[:quantity].to_i
      oldquantity = @cart[params[:id]].to_i
      @cart[params[:id]] = quantity + oldquantity
    else
      @cart[params[:id]] = params[:quantity]
    end
  end

  def update_product
    if @cart[params[:id]]
      @cart[params[:id]] = params[:quantity]
    end
    redirect_to carts_path
  end

  def remove_product
    @cart.delete params[:id]
    redirect_to carts_path
  end

  def load_cart
    if cookies[:cart]
      @cart = JSON.parse(cookies[:cart])
    else
      @cart = {}
    end
  end

  def write_cart
    cookies[:cart] = JSON.generate(@cart)
  end

end
