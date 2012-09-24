class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_cart
    if session[:cart_id]
      @current_cart ||= Cart.find(session[:cart_id])
      session[:cart_id] = nil if @current_cart.purchased_at
    end
    if session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end
      
    # private

    #   def current_order
    #     Order.find(session[:order_id])
    #   rescue ActiveRecord::RecordNotFound
    #     order = Order.create
    #     session[:order_id] = order.id
    #     order
    #   end
  end
