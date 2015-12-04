class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def calculate_cart_count
    if current_user
      if session[:cart_count]
        @cart_count = session[:cart_count]
      else
        session[:cart_count] = current_user.carted_products.where(status: "carted".count
      end
    end
  end

  def authenticate_admin!
    flash[:danger] = "What you doin?!"
    redirect_to "/" unless current_user && current_user.admin?
  end

  def calculate_subtotal(carted_products)
    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += (carted_prouct.price * carted_product.quantity)
    end
    return subtotal
  end

  def calculate_tax(carted_products)
    tax = 0
    carted_products.each do |carted_product|
      tax += (carted_product.product.tax * carted_product.quantity)
    end
    return tax
  end
end
