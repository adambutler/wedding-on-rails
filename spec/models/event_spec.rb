require "rails_helper"

RSpec.describe Event, :type => :model do
  context "days to go" do
    it "responds with 1 when the date is tomorrow" do
      event = Event.create!(date: Date.today + 1)
      expect(event.days_to_go).to be 1
    end

    it "responds with 0 when the date is in the past" do
      [-1, -10, -1000].each do |days_ago|
        event = Event.create!(date: Date.today + days_ago)
        expect(event.days_to_go).to be 0
      end
    end

    it "responds with 0 when the date is in today" do
      event = Event.create!(date: Date.today)
      expect(event.days_to_go).to be 0
    end
  end

  context "formatted time" do
    it "should format the event date time correctly" do
      event = Event.create!(date: Date.parse("1/1/1970"))
      expect(event.formatted_time).to eq "Thursday 1st January 1970"
    end
  end

  context "in_past?" do
    it "responds with false when the date is today" do
      event = Event.create!(date: Date.today)
      expect(event.in_past?).to be false
    end

    it "responds with false when the date is tomorrow" do
      event = Event.create!(date: Date.today + 1)
      expect(event.in_past?).to be false
    end

    it "responds with true when the date is yesterday" do
      event = Event.create!(date: Date.today - 1)
      expect(event.in_past?).to be true
    end
  end

  context "is_today?" do
    it "responds with true when the date is today" do
      event = Event.create!(date: Date.today)
      expect(event.is_today?).to be true
    end

    it "responds with false when the date is tomorrow" do
      event = Event.create!(date: Date.today + 1)
      expect(event.is_today?).to be false
    end

    it "responds with true when the date is yesterday" do
      event = Event.create!(date: Date.today - 1)
      expect(event.is_today?).to be false
    end
  end
end
