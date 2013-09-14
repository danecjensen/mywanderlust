class TripsController < ApplicationController
  # before_filter :authenticate_user!
  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find_by_webstring(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.json
  def new
    @trip = Trip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    def avatar_url(email, size)
      gravatar_id = Digest::MD5::hexdigest(email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=mm"
    end  

    @trip = Trip.find_by_webstring(params[:id])
    if @trip.user
      gon.trip_owner = @trip.user.name ||= "Enter your name"
    else
      gon.trip_owner = "Anonymous Person"
    end

    if current_user
      gon.current_username = current_user.name
      gon.current_userphoto = avatar_url(current_user.email, 30)
    else
      gon.current_username = "Anonymous"
      gon.current_userphoto = avatar_url("user@example.com", 30)      
    end

    gon.trip = @trip
    gon.destinations = @trip.destinations
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(params[:trip])

    if user_signed_in?
      @trip.user_id = current_user.id
    end


    cookies[:current_lat] = params[:trip][:current_lat]
    cookies[:current_lng] = params[:trip][:current_lng]
    cookies[:current_city] = params[:trip][:name]

    respond_to do |format|
      if @trip.save
        format.html { redirect_to edit_trip_path(@trip), notice: 'Trip was successfully created.' }
        format.json { render json: @trip, status: :created, location: @trip }
      else
        format.html { render action: "new" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def share
    @email = params[:email]
    @url = params[:url]
    TripMailer.share_trip_email(@email, @url).deliver 
    # flash[:notice] = "Email sent." 
    render :nothing => true
  end

  # PUT /trips/1
  # PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end
end
