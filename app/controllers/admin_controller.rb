class AdminController < ApplicationController
  layout "admin"
  before_filter :authenticate

  def dashboard
    @event = Event.first
    @guests = Guest.all
    @groups = Group.all

    @section = Section.new
  end

  private

  def authenticate
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
      end
    end
  end
end
