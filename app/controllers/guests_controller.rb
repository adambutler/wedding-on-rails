class GuestsController < ApplicationController
  def new
    @guest = Guest.new
  end

  private

  def guest_params
    params.require(:guest).permit()
  end
end
