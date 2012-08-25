class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    if session["user_id"].present?
      @user = User.find_by_id(session["user_id"])
      if @user.business == 'Farm'
        redirect_to farmer_list_url
      elsif @user.business == 'Restaurant'
        redirect_to chef_list_url
      end
    else
      @user = User.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @user }
      end
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def new2
    # if session["user_id"].present?
    #   @user = User.find_by_id(session["user_id"])
    #   if @user.business == 'Farm'
    #     redirect_to farmer_step3_url
    #   elsif @user.business == 'Restaurant'
    #     redirect_to chef_step3_url
    #   end
    # else
      @user = User.find_by_id(session["user_id"])

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @user }
      end
    #end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to newlogin_url(params[:user]), notice: 'User was successfully created.' }
        format.json { render json: newlogin_url(params[:user]), status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update2
    @user = User.find_by_id(session["user_id"])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        if @user.business == "Farm"
          format.html { redirect_to farmer_step3_url, notice: 'User was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { redirect_to chef_step3_url, notice: 'User was successfully updated.' }
          format.json { head :no_content }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
