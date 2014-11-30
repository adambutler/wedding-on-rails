class PhotosController < ApplicationController
  before_filter :set_photo, only: [:show]

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save
    redirect_to :back
  end

  private

  def photo_params
    params.require(:photo).permit(:file, :file_url)
  end

  def set_photo
    @photo = Photo.find params[:id]
  end
end
