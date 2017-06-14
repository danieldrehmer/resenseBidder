class ParticipantsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "participants_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def new_participant
  	participants = Auction.first.active_users

  	ActionCable.server.broadcast 'participants_channel', message: {"count" => participants.size, "participants" => participants}

  end
end
