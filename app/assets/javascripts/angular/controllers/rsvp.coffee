app = angular.module('foh')

app.controller "RsvpController", ["$scope", "Restangular", ($scope, Restangular) ->
  $("select")
    .select2
      width: "element"
      minimumInputLength: 3
    .on "change", (e) ->
      Restangular.one('events', 1).one('groups', e.val).getList("guests").then (group) ->
        $scope.group = group

  $scope.newGuest = {}

  $scope.toggleRsvp = (guest) ->
      guest.rsvp = !guest.rsvp
      guest.put()

  $scope.defineGuest = (guest) ->
    guest.name = $scope.newGuest.name
    guest.is_guest = false
    guest.rsvp = true
    guest.put()

  $scope.toggleVegetarian = (guest) ->
    guest.put()

  # Restangular.one('events', 1).one('groups', 3).getList("guests").then (group) ->
  #       $scope.group = group

  $scope.rsvpStatus = (guest) ->
    return "Thank you for your RSVP, we look forward to seeing you :)" if guest.rsvp
    return "Feel free to add a guest to your RSVP by adding their name above." if guest.is_guest
    return "You have not yet RSVP'd."

  $scope.rsvpButtonText = (guest) ->
    return "Sorry I can no longer make it" if guest.rsvp
    return "Add guest" if guest.is_guest
    return "Yes I can attend"

  $scope.guestName = (guest) ->
    return "Guest" if guest.is_guest
    return guest.name
]
