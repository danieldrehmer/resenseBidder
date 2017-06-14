class TimerChannel < ApplicationCable::Channel
  def subscribed
    stream_from "timer_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def timekeeper


  	  while true
  		  sleep 10

        auction = Auction.first

        duration = auction.duration
        end_time = auction.start_time + duration

        time_left = (end_time - Time.now).to_i

        ActionCable.server.broadcast 'timer_channel', message: time_left
    	end

  end
end
