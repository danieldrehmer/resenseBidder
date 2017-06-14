class AuctionController < ApplicationController
  def index

  	@auction = Auction.first

  	@auction.active_users ||= []

    @auction.start_time ||= Time.now

  	session[:current_user_id] ||= User.unique_random(@auction.active_users).id

  	@user = User.find(session[:current_user_id])

  	unless (@auction.active_users.include?(session[:current_user_id]) 	) 

		@auction.active_users << session[:current_user_id] 		

	end

	@auction.save

	@shows = TvShow.chrorder

	@showsJson = TvShow.chrorderHash.to_json


  end
end
