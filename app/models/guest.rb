class Guest < ActiveRecord::Base
  belongs_to :group
  belongs_to :event
end
