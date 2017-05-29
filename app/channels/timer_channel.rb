class TimerChannel < ApplicationCable::Channel
  def subscribed
    stream_from "timer_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def timekeeper
  	while true
  		sleep 1; ActionCable.server.broadcast 'timer_channel', message: Time.now.to_s
  	end
  end
end
