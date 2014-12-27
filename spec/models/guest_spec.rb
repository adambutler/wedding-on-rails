require "rails_helper"

RSpec.describe Guest, :type => :model do
  context "on creation" do
    it "creates a group" do
      guest = Guest.create!(event_id: 1)
      group = guest.group
      expect(guest.group).to_not be_nil
    end
  end

  context "guests without a name" do
    guest = Guest.create!(event_id: 1)

    it "has a name of Guest" do
      expect(guest.name).to eq("Guest")
    end

    it "responds to is_guest? with true" do
      expect(guest.is_guest?).to be true
    end
  end

  context "guests with a name" do
    guest = Guest.create!({event_id: 1, name: "Foo"})

    it "responds to is_guest? with false" do
      expect(guest.is_guest?).to be false
    end
  end
end
