# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

event = Event.create({
  date: Time.parse("2015-06-13"),
  location: "Mansion House, Clifton, Bristol, UK",
  active: true,
  title: "Adam & Cerys",
  partner_one: "Adam",
  partner_two: "Cerys",
  venue_name: "Mansion House",
  venue_address_line_one: "Clifton down",
  venue_address_city: "Bristol",
  venue_address_state: "Bristol",
  venue_address_zip: "BS8 3LJ",
  venue_address_country: "United Kingdom"
})

butlers = Group.create({
  event_id: event.id
})

owens = Group.create({
  event_id: event.id
})

ian = Guest.create({
  name: "Ian Butler",
  rsvp: true,
  invited_to_ceremony: true,
  invited_to_evening: true,
  group_id: butlers.id,
  event_id: event.id
})

mary = Guest.create({
  name: "Mary Butler",
  rsvp: true,
  invited_to_ceremony: true,
  invited_to_evening: true,
  group_id: butlers.id,
  event_id: event.id
})

bryan = Guest.create({
  name: "Bryan Owen",
  rsvp: true,
  invited_to_ceremony: true,
  invited_to_evening: true,
  group_id: owens.id,
  event_id: event.id
})

joyce = Guest.create({
  name: "Joyce Owen",
  rsvp: true,
  invited_to_ceremony: true,
  invited_to_evening: true,
  group_id: owens.id,
  event_id: event.id
})
