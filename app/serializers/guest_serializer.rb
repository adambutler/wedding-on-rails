class GuestSerializer < ActiveModel::Serializer
  attributes :id, :name, :rsvp, :vegetarian, :is_guest?
end
