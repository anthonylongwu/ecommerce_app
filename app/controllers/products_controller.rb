class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :search]
  
  def index
    @categories = Category.all
    if params[:view] == "discounted"
      @products = Product.where("price < ?", 50)
    elsif params[:view] == "low_to_high"
      @products = Product.order(:price)
      elsif params[:view] == "high_to_low"
        @products = Product.order(price: :DESC)
      elsif params[:category]
        @products = Category.find_by(name: params[:category]).products
    else
    @products = Product.all
    end
  end

  def show
    @carted_product = CartedProduct.new
    if params[:id] == "random"
      @products = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end
  end

  def new
    if current_user && current_user.admin?
    @product = Product.new
      else redirect_to "/"
    end
  end
  
  def create
    name = params[:name]
    price = params[:price]
    image = params[:image]
    description = params[:description]
    @product = Product.create(name: name, price: price, image: image, description: description, user_id: current_user.id, supplier_id: supplier_id )
    if @product.save
    flash[:success] = "Product Created"
    redirect_to "/products/#{product.id}"
  else
    render :new
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
    @products = Product.where("name LIKE ? OR descrption LIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    render :index
  end
end
