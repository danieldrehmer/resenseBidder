class Auction < ApplicationRecord

  serialize :active_users

  def self.hard_reset
    a = Auction.first

    a.active_users = []

    a.save

    Auction.soft_reset
  end

  def self.soft_reset

  	a = Auction.first

  	a.bid_counter = 0

    a.start_time = nil

    a.save

  	TvShow.reset_all

  	ActionCable.server.broadcast 'auction_channel', message:{"reload"=> true}

  end


end
