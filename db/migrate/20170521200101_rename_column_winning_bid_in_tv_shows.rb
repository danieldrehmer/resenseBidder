class RenameColumnWinningBidInTvShows < ActiveRecord::Migration[5.1]
  def change
  	rename_column :tv_shows, :winning_bid, :winning_bid1
  end
end
