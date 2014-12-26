class Guest < ActiveRecord::Base
  belongs_to :group
  belongs_to :event

  before_create :create_guest_group
  after_initialize :init

  def init
    self.name ||= "Guest"
  end

  def is_guest?
    !name.nil?
  end

  private

  def create_guest_group
    self.group = Group.create!(event_id: self.event_id) if self.group.nil?
  end
end

