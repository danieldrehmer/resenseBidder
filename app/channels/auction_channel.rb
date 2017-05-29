class AuctionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "auction_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def timesync
  end

  def bid(data)
    show_id = data["message"]["show_id"]
    user_id = data["message"]["user_id"]

  
    puts "-----------------------------------------------"
    puts "O id do usuário é #{data["message"]["user_id"]}"
    puts "O id da bid foi #{data["message"]["show_id"]}"
    puts "-----------------------------------------------"

    show = TvShow.find(show_id.to_i)

    former_winner = show.winner1

    show.winning_bid2 = show.winning_bid1

    show.winning_bid1 = show.winning_bid1 * 1.1    

    show.winner1 = user_id.to_i

    unless (show.winner1 == nil)
      unless (show.winner1 == former_winner)
        show.winner2 = former_winner
      end
    end

    

    show.save

    ActionCable.server.broadcast 'auction_channel', message: {"show_id" => show_id, "user_id" => user_id, "winner1"=> show.winner1, "winner2" => show.winner2, "winning_bid1" => show.winning_bid1.to_f, "winning_bid2" => show.winning_bid2.to_f, "reload" => false}
    
  end
end
