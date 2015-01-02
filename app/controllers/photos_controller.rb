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
      EventNotification.find_or_create_by({notification_type: "photo_upload", event_id: @event.id, photo_id: @photo.id})
      photo_urls << @photo.file_url
    end

    Event.delay(queue: "notification", run_at: 30.seconds.from_now).send_notifications(@event.id)

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
