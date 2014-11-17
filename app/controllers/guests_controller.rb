class GuestsController < ApplicationController
  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    create_group if @guest.group.nil?
    @guest.save
  end

  def create_group
    @group = Group.create
    @guest.group_id = @group.id
  end

  private

  def guest_params
    params.require(:guest).permit(:name, :rsvp, :invited_to_ceremony, :invited_to_evening, :vegetarian, :arrival_transportation_required, :departing_transport_requred, :group_id)
  end
end
