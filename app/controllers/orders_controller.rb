class OrdersController < ApplicationController
  
  def create
    product = Product.find_by(id: params[:product_id])
    product_id = params[:product_id]
    quantity = params[:quantity].to_i
    subtotal = product.price * quantity
    tax = product.tax * quantity
    total = tax + subtotal 

    order = Order.create(user_id: current_user.id, quantity: quantity, product_id: product.id, subtotal: subtotal, tax: tax, total: total)
    redirect_to '/orders/#{order.id}'
  end
  
  def show
   @order = Order.find_by(id:params[:id])
  end

end
