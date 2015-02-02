class Guest < ActiveRecord::Base
  belongs_to :group
  belongs_to :event

  validates_presence_of :event

  has_many :event_notifications

  before_create :create_guest_group
  after_initialize :init

  def init
    self.name ||= "Guest"
    self.vegetarian ||= false
  end

  def is_guest?
    self.name == "Guest"
  end

  def self.attending
    where({rsvp: true})
  end

  def self.not_attending
    where({rsvp: false})
  end

  def self.attendance_unknown
    where({rsvp: nil})
  end

  private

  def create_guest_group
    self.group = Group.create!(event_id: self.event_id) if self.group_id.nil?
  end
end

