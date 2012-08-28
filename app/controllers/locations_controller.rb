class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.json
  def index
    if params[:search].present?
      @locations = Location.near(params[:search], 50, :order => :distance)
    else
      @locations = Location.all
    end

    @farm = User.find_by_id(session["user_id"])
    @loc = @farm.fulladdress
    @temp = Location.new
    @temp.id = @locations.last.id+1
    @temp.latitude = @farm.latitude
    @temp.longitude = @farm.longitude

    @dist = []
    
       for dropoff in @farm.nearbys(10)
         @dist << dropoff.distance.round(2)
       end  

    @url = "http://maps.googleapis.com/maps/api/staticmap?center=#{@loc}&markers=#{@loc}&zoom=11&size=600x600&maptype=roadmap&markers=color:green"
    @locations.each do |location|
      if location.day == "Monday"
      @url = @url + "%7Clabel:M%7C#{location.latitude},#{location.longitude}&markers=color:green"
      elsif location.day == "Tuesday"
      @url = @url + "%7Clabel:T%7C#{location.latitude},#{location.longitude}&markers=color:green"
      elsif location.day == "Wednesday"
      @url = @url + "%7Clabel:W%7C#{location.latitude},#{location.longitude}&markers=color:green"
      elsif location.day == "Thursday"
      @url = @url + "%7Clabel:R%7C#{location.latitude},#{location.longitude}&markers=color:green"
      elsif location.day == "Friday"
      @url = @url + "%7Clabel:F%7C#{location.latitude},#{location.longitude}&markers=color:green"
      elsif location.day == "Saturday"
      @url = @url + "%7Clabel:S%7C#{location.latitude},#{location.longitude}&markers=color:green"
      elsif location.day == "Sunday"
      @url = @url + "%7Clabel:U%7C#{location.latitude},#{location.longitude}&markers=color:green"
      end
    end    
    @url = @url + "&sensor=false"

  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.json
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end
end
