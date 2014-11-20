class GroupsController < ApplicationController
  before_filter :set_event, only: [:index, :show, :edit, :destroy]
  before_filter :set_group, only: [:show, :edit, :destroy]

  def show
  end

  def edit
  end

  def destroy
    @group.destroy
    redirect_to :back
  end

  private

  def set_event
    @event = Event.find params[:event_id]
  end

  def set_group
    @group = @event.groups.find params[:id]
  end

  def guest_params
    params.require(:guest).permit(:name, :rsvp, :invited_to_ceremony, :invited_to_evening, :vegetarian, :arrival_transportation_required, :departing_transport_requred, :group_id)
  end
end
