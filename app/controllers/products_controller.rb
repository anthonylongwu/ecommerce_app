class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end

  def new
  end
  
  def create
    name = params[:name]
    price = params[:price]
    image = params[:image]
    description = params[:description]
    Product.create(name: name, price: price, image: image, description: description)
  end


  def show
    id = params[:id]
    @product = Product.find_by(id: id)
  end

    def edit
    id = params[:id]
    @product = Product.find_by(id: id)
    end 

    def update
      id = params[:id]
      product = Product.find_by(id: id)
      name = params[:name]
      price = params[:price]
      image = params[:image]
      description = params[:description]
      Product.update(name: name, price: price, image: image, desctiption: description)
    end
end
