class GuestDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def rsvp
    return "Unknown" if model.rsvp.nil?
    return model.rsvp ? h.content_tag(:span, "Yes", class: "text--success") : h.content_tag(:span, "No", class: "text--error")
  end

end
