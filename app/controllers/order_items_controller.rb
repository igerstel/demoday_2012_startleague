class OrderItemsController < ApplicationController
  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = OrderItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @order_items }
    end
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
    @order_item = OrderItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order_item }
    end
  end

  # GET /order_items/new
  # GET /order_items/new.json
  def new
    @order_item = OrderItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order_item }
    end
  end

  # GET /order_items/1/edit
  def edit
    @order_item = OrderItem.find(params[:id])
  end

  # POST /order_items
  # POST /order_items.json
  def create
    @cart = current_cart
    @product = Product.find(params[:id])
    @order_item = @cart.order_items.build
    @order_item.product_id = @product.id
    #@order_item = OrderItem.create!(:cart => current_cart, :product => @product, :qty_ordered => params[:qty_ordered], :qty_ordered_price => @product.price)
    #@order_item = OrderItem.find_or_initialize_by_cart_id(:cart_id => current_cart.id, :cart => current_cart, :product => @product, :qty_ordered => params[:qty_ordered], :qty_ordered_price => @product.price)
    # @order_item = OrderItem.new
    # @order_item.cart_id = current_cart.id
    # @order_item.product_id = @product.id
    @order_item.qty_ordered = params[:qty]
    @order_item.qty_ordered_price = @product.price
    @order_item.save
    flash[:notice] = "Added #{@product.name} to cart."
    redirect_to current_cart_url

    # @order = current_order
    # product = Product.find(params[:product_id])
    # # @order_item = OrderItem.new(params[:order_item]) Ian's line
    # @order_item = @order.add_product(product.id)
    
    # if Order.last == nil
    #     @order_item.order_id = 1
    #   else @order_item.order_id = Order.last.id + 1
    #   end
    #   @order_item.qty_ordered_price = @order_item.product.price

    # respond_to do |format|
    #   if @order_item.save
    #     format.html { redirect_to @order_item.order, notice: 'Order item was successfully created.' }
    #     format.json { render json: @order_item, status: :created, location: @order_item }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @order_item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PUT /order_items/1
  # PUT /order_items/1.json
  def update
    @order_item = OrderItem.find(params[:id])

    respond_to do |format|
      if @order_item.update_attributes(params[:order_item])
        format.html { redirect_to @order_item, notice: 'Order item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy

    respond_to do |format|
      format.html { redirect_to order_items_url }
      format.json { head :no_content }
    end
  end
end
