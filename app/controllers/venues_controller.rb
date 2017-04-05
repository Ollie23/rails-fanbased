class VenuesController < ApplicationController
  def index
    # @bars = current_user.bar
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to venue_path(@venue.id)
    else
      render :new
    end
  end

  def show
    # if current_user.owns_bar?(Bar.find(params[:id]))
    @venue = Venue.find(params[:id])
      # @venue_coordinates = { lat: @venue.latitude, lng: @venue.longitude }
      # @venue = Venue.where.not(latitude: nil, longitude: nil)

      # @hash = Gmaps4rails.build_markers(@bar) do |venue, marker|
      #   marker.lat bar.latitude
      #   marker.lng bar.longitude
        # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
      end

      def edit
        @venue = Venue.find(params[:id])
      end

      def update
        @venue = Venue.find(params[:id])
        @venue.update(venue_params)
        redirect_to venues_path(@venue)
      end

      def destroy
        @venue = Venue.find(params[:id]).destroy
        redirect_to venue_path
      end

      private

      def venue_params
        params.require(:venue).permit(:name, :address, :description, :rating, :close, :screens, :internet, :food, :price_range)
      end
    end



