class Group < ActiveRecord::Base
  has_many :guests, dependent: :destroy
  belongs_to :event

  validates_presence_of :event_id
end
