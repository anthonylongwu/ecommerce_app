class ProductsController < ApplicationController
  
  def index
    if params[:view] == "discounted"
      @products = Product.where("price < ?", 50)
    elsif params[:view] == "low_to_high"
      @products = Product.order(:price)
      elsif params[:view] == "high_to_low"
        @products = Product.order(price: :DESC)
    else
    @products = Product.all
    end
  end

  def new
  end
  
  def create
    name = params[:name]
    price = params[:price]
    image = params[:image]
    description = params[:description]
    product = Product.create(name: name, price: price, image: image, description: description)
    flash[:success] = "Product Created"
    redirect_to "/products/#{product.id}"
  end


  def show
    if params[:id] == "random"
      @products = Product.all.sample
    else
    id = params[:id]
    @product = Product.find_by(id: id)
    end
  end

  def edit
    id = params[:id]
    @product = Product.find_by(id: id)
  end 

  def destroy
      id = params[:id]
      product = Product.find_by(id: id)
      product.destroy
      flash[:danger] = "Product deleted"
      redirect_to "/"
  end

  def update
      id = params[:id]
      product = Product.find_by(id: id)
      name = params[:name]
      price = params[:price]
      image = params[:image]
      description = params[:description]
      product = Product.update(name: name, price: price, image: image, description: description)
      flash[:notice] = "Product updated"
      redirect_to "/products/#{product.id}"  
  end

  def search
    search_term = params[:search]
    @products = Product.where("name LIKE ? OR descrion LIKE ?", "%#{search_term}%", "%#{search_term}%")
    render :index
  end
end
