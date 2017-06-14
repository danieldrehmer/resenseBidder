App.participants = App.cable.subscriptions.create "ParticipantsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log "hello from coffee"

    participantsUpdate(data["message"])

  new_participant: ->
    @perform 'new_participant'
