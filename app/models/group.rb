class Group < ActiveRecord::Base
  has_many :guests, dependent: :destroy
  belongs_to :event

  def title
    (guests.map do |guest| guest.name end).to_sentence
  end
end
