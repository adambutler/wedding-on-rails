class GuestsController < ApplicationController
  before_filter :set_event
  before_filter :set_group, only: [:index, :show]
  before_filter :set_groups, only: [:index]
  before_filter :set_guest, only: [:show, :update, :edit, :destroy]
  before_filter :set_guests, only: [:index]

  def index
    render json: @guests
  end

  def update
    @guest.update_attributes(guest_params)
    EventNotification.find_or_create_by({notification_type: "rsvp", event_id: @guest.event.id, guest_id: @guest.id})
    Event.delay(queue: "notification", run_at: notification_delay).send_notifications(@guest.event.id)
    render :nothing => true, :status => 200
  end

  private

  def guest_params
    params.require(:guest).permit(:name, :rsvp, :invited_to_ceremony, :invited_to_evening, :vegetarian, :arrival_transportation_required, :departing_transport_requred, :group_id)
  end

  def set_event
    @event = Event.find params[:event_id] || default_event
  end

  def set_group
    @group = @event.groups.find params[:group_id] if params[:group_id]
  end

  def set_groups
    @groups = @event.groups.all
  end

  def set_guest
    guest_id = params[:guest_id] || params[:id]
    @guest = @event.guests.find guest_id
  end

  def set_guests
    if @group
      @guests = @group.guests.all
    else
      @guests = @event.guests.all
    end
  end
end
