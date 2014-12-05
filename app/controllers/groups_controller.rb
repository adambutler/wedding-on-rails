class GroupsController < ApplicationController
  before_filter :set_event, only: [:index, :show, :edit, :destroy]
  before_filter :set_group, only: [:show, :edit, :destroy]
  before_filter :set_guests, only: [:show]

  def show
    render json: @guests
  end

  def edit
  end

  def destroy
    @group.destroy
    redirect_to :back
  end

  private

  def set_event
    @event = Event.find params[:event_id] || default_event
  end

  def set_group
    @group = @event.groups.find params[:id]
  end

  def set_guests
    @guests = @group.guests.all
  end

  def guest_params
    params.require(:guest).permit(:name, :rsvp, :invited_to_ceremony, :invited_to_evening, :vegetarian, :arrival_transportation_required, :departing_transport_requred, :group_id)
  end

end
