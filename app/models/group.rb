class Group < ActiveRecord::Base
  has_many :guests

  def title
    (guests.map do |guest| guest.name end).to_sentence
  end
end
