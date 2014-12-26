class Guest < ActiveRecord::Base
  belongs_to :group
  belongs_to :event

  after_initialize :init

  def init
    self.name  ||= "Guest"
  end

  def is_guest?
    name.nil?
  end
end
