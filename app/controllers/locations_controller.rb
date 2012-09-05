class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.json
  def index

#@markers = '[
#             {"description": "", "title": "", "sidebar": "", "lng": "", "lat": "", "picture": "", "width": "", "height": ""},
 #            {"lng": "", "lat": "" }
  #          ]'

    # @json = Location.all.to_gmaps4rails
    @location = Location.first
    @lc = Location.count
    @q = Location.search(params[:q])
    if params[:q].present?
      @json = @q.to_gmaps4rails
    end
    if @lc == 0
      @locations = Location.new
    elsif params[:q].present?
      @locations = @q.result(:distinct => true)
    else
      @locations = Location.all
    end
    @temp = Location.new
    if (@lc == 0) #|| (!@json.present?)
      @temp.id = 1
    else @temp.id = @locations.last.id
    end
    if session["user_id"] != nil
      @farm = User.find_by_id(session["user_id"])
    else 
      @farm = User.new
      @farm.latitude = 41.8865
      @farm.longitude = 87.638
    end
    @temp.latitude = @farm.latitude
    @temp.longitude = @farm.longitude
    if @temp.latitude == nil
      @temp.latitude = 41.8865
      @temp.longitude = 87.638
    end  

    @markers = []
    @markers << {lat: @location.latitude, lng: @location.longitude}  


     @json = Location.all.to_gmaps4rails

     @json << @temp.to_gmaps4rails
    # @dist = []
    
    #for dropoff in @temp.nearbys(10)
    #  @dist << dropoff.distance.round(2)
    #end

  #   @url = "http://maps.googleapis.com/maps/api/staticmap?center=#{@loc}&markers=#{@loc}&zoom=11&size=600x600&maptype=roadmap&markers=color:green"
  #   if @lc != 0 
  #   JSON.parse(@json).each do |location|
  #     if location["day"] == "Monday"
  #     @url = @url + "%7Clabel:M%7C#{location.latitude},#{location.longitude}&markers=color:green"
  #     elsif location["day"] == "Tuesday"
  #     @url = @url + "%7Clabel:T%7C#{location.latitude},#{location.longitude}&markers=color:green"
  #     elsif location["day"] == "Wednesday"
  #     @url = @url + "%7Clabel:W%7C#{location.latitude},#{location.longitude}&markers=color:green"
  #     elsif location["day"] == "Thursday"
  #     @url = @url + "%7Clabel:R%7C#{location.latitude},#{location.longitude}&markers=color:green"
  #     elsif location["day"] == "Friday"
  #     @url = @url + "%7Clabel:F%7C#{location.latitude},#{location.longitude}&markers=color:green"
  #     elsif location["day"] == "Saturday"
  #     @url = @url + "%7Clabel:S%7C#{location.latitude},#{location.longitude}&markers=color:green"
  #     elsif location["day"] == "Sunday"
  #     @url = @url + "%7Clabel:U%7C#{location.latitude},#{location.longitude}&markers=color:green"
  #     end
  #   end    
  # end
  # @url = @url + "&sensor=false"

  end

  def index2
    @location = Location.new(params[:location])
    @location.user_id = session["user_id"]

    respond_to do |format|
      if @location.save
        format.html { redirect_to locations_url, notice: 'Dropoff was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { redirect_to flocations_url }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
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
