class PhotosController < ApplicationController
  before_filter :set_event, only: [:index, :show, :new, :create]
  before_filter :set_photo, only: [:show]

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
    photo_urls = []
    photos = params[:photo][:file]
    photos.each do |photo|
      @photo = Photo.new
      @photo.file = photo
      @photo.event_id = @event.id
      @photo.save
      photo_urls << @photo.file_url
    end
    render json: photo_urls
  end

  private

  def photo_params
    params.require(:photo).permit(:file)
  end

  def set_event
    @event = Event.find params[:event_id] || default_event
  end

  def set_photo
    @photo = Photo.find params[:id]
  end
end
