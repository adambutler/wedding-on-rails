app = angular.module('foh')

app.factory "Group", ["$resource", ($resource) ->
  $resource("/:event_id/groups/:group_id.json",
    event_id: 1
    group_id: 1
  ,
    get:
      method: "GET"
      isArray: true
    update:
      method: "PUT"
  )
]
