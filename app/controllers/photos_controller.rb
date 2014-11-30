class PhotosController < ApplicationController
  before_filter :set_event, only: [:index, :show, :new, :create]
  before_filter :set_photo, only: [:show]

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save
    redirect_to [@event, @photo]
  end

  private

  def photo_params
    params.require(:photo).permit(:file, :file_url)
  end

  def set_event
    @event = Event.find params[:event_id]
  end

  def set_photo
    @photo = Photo.find params[:id]
  end
end
