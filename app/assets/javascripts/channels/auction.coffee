App.auction = App.cable.subscriptions.create "AuctionChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log data["message"]

    if data["message"]["reload"]
      reload()
    else
      bidUpdate(data["message"])

    #console.log data


  timesync: ->
    @perform 'timesync'

  bid: (showId, user_id)->
    @perform 'bid', message: {"show_id": showId, "user_id": user_id}
