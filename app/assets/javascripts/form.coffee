class Rsvp
  event: 1

  setupFormEvents: ->
    $("#rsvp-form form").on "ajax:send", ->
      $button = $(@).find("input[type=submit]")
      $button.data "value-original", $button.val()
      $button.attr "disabled", "disabled"
      $button.val("Sending")

    $("#rsvp-form form").on "ajax:complete", ->
      $button = $(@).find("input[type=submit]")
      $button.removeAttr "disabled"

    $("#rsvp-form form").on "ajax:success", ->
      $button = $(@).find("input[type=submit]")
      $button.val "Sent! Thank you!"

    $("#rsvp-form form").on "ajax:error", (xhr, status, error) ->
      alert "Something went wrong and your RSVP wasn't saved. Please call us or RSVP later on."
      $button = $(@).find("input[type=submit]")
      $button.val "Try again!"

  getForms: (callback) ->
    total  = @guests.length
    complete = 0
    for guest in @guests
      $.ajax
        url: "/#{@event}/guests/#{guest.id}/rsvp"
        data:
          raw: true
        success: (data) ->
          $(data)
            .checkBo()
            .appendTo "#rsvp-form"
          complete++
          callback() if complete == total

  getGuests: ->
    console.log "/#{@event}/groups/#{@group}"
    $.ajax
      url: "/#{@event}/groups/#{@group}"
      dataType: "json"
      success: (data) =>
        @guests = data
        @getForms =>
          @setupFormEvents()

  setGroup: (groupID) ->
    @group = groupID
    @getGuests()

$ ->
  rsvp = new Rsvp()

  $(".js-datetimepicker").datetimepicker
    timepicker: false
    format: 'd-m-Y'

  $("select")
    .select2
      width: "element"
      minimumInputLength: 3
    .on "change", (e) ->
      $("#rsvp-form").html("")
      rsvp.setGroup e.val
