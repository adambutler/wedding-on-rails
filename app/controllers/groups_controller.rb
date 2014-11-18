class GroupsController < ApplicationController
  def edit
  end

  def destroy
  end

  private

  def guest_params
    params.require(:guest).permit(:name, :rsvp, :invited_to_ceremony, :invited_to_evening, :vegetarian, :arrival_transportation_required, :departing_transport_requred, :group_id)
  end
end
