class ProductsController < ApplicationController

  #resources :order_item

  # GET /products
  # GET /products.json
  def index
    #@products = Product.all
    @user = User.find_by_id(session["user_id"])
    @q = Product.search(params[:q])
    @products = @q.result(:distinct => true)
    if params[:cat].present?
      @products = @products.find_all_by_product_attribute(params[:cat])
    end
    if params[:loc].present?
      @products = @products.find_all_by_user_id(params[:loc])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def list
    @user = User.find_by_id(session["user_id"])
    #@products = @user.products.find(:all, :conditions => ['created_at >= ? and created_at <= ?', @start_date, @end_date])
    @product = Product.new

    if params[:start_date].present? && params[:end_date].present?
      @start_date = params[:start_date]
      @end_date = params[:end_date]
    else
      @start_date = (Date.today.beginning_of_week).to_s#today-6).to_s
      @end_date = (Date.today.end_of_week).to_s#today+1).to_s
    end

    @products = @user.products.where("created_at >= ? and created_at <= ?", @start_date, @end_date)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def list2
    @product = Product.new(params[:product])
    @product.user_id = session["user_id"]

    respond_to do |format|
      if @product.save
        format.html { redirect_to farmer_list_url, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { redirect_to farmer_step3_url }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end  

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @order_item = OrderItem.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end
  
  def new3
    @product = Product.new

    if params[:start_date].present? && params[:end_date].present?
      @start_date = params[:start_date]
      @end_date = params[:end_date]
    else
      @start_date = (Date.today.beginning_of_week).to_s#today-6).to_s
      @end_date = (Date.today.end_of_week).to_s#today+1).to_s
     end    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  def new4
    @product = Product.new(params[:product])

    @product.user_id = session["user_id"]
    respond_to do |format|
      if @product.save
        format.html { redirect_to farmer_list_url, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { redirect_to farmer_step3_url }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end  

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to farmer_list_url }
      format.json { head :no_content }
    end
  end

end
