class ProductsController < ApplicationController
    def index
        @products = Product.all.order(created_at: :desc)
    end

    def new
      @product = Product.new
    end


    def create
        @product = Product.create(product_params)

        if @product.save
            flash[:success] = "You've created a new product."
            redirect_to products_path
        else
            flash[:danger] = @product.errors.full_messages
            redirect_to new_product_path
        end
    end

    def edit
        @product = Product.find_by(id: params[:id])

    end

    def update
        @product = Product.find_by(id: params[:id])

        if @product.update(product_params)
            flash[:success] = "You've successfully updated your product."
            redirect_to products_path(@product)
        else
            flash[:danger] = @product.errors.full_messages
            redirect_to edit_product_path(@product)
        end
    end

    def destroy
        @product = Product.find_by(id: params[:id])

        if @product.destroy
            flash[:success] = "You've successfully deleted your topic."
            redirect_to products_path
        else
            redirect_to product_path(@product)
          end
    end

    private

    def product_params
        params.require(:product).permit(:image, :title, :price, :quantity)
    end
end
