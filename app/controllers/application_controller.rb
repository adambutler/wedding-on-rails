class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_action :allow_iframe

  private

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

  def default_event
    Event.first
  end

  def default_serializer_options
    {root: false}
  end

  def notification_delay
    5.minutes.from_now
  end
end
