class GroupDecorator < Draper::Decorator
  delegate_all
  decorates_association :guests

  def title
    (guests.map do |guest| guest.name end).to_sentence
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
