app = angular.module('foh')

app.factory "Guest", ["$resource", ($resource) ->
  $resource("/:event_id/guests/:guest_id.json",
    event_id: 1
    guest_id: 1
  ,
    get:
      method: "GET"
      isArray: true
    update:
      method: "PUT"
  )
]
