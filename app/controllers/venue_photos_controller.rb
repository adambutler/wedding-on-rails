class VenuePhotosController < ApplicationController
  before_filter :set_event, only: [:index, :show, :new, :create, :set_primary]
  before_filter :set_venue_photo, only: [:show]

  def show
  end

  def new
    @venue_photo = VenuePhoto.new
  end

  def create
    venue_photo_urls = []
    venue_photos = params[:venue_photo][:file]
    venue_photos.each do |venue_photo|
      @venue_photo = VenuePhoto.new
      @venue_photo.file = venue_photo
      @venue_photo.event_id = @event.id
      @venue_photo.save
      venue_photo_urls << @venue_photo.file_url
    end
    render json: venue_photo_urls
  end

  def set_primary
    @event.primary_venue_photo
  end

  private

  def venue_photo_params
    params.require(:venue_photo).permit(:file)
  end

  def set_event
    @event = Event.find params[:event_id] || default_event
  end

  def set_venue_photo
    @venue_photo = VenuePhoto.find params[:id]
  end
end
