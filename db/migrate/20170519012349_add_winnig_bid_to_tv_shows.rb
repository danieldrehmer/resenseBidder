class AddWinnigBidToTvShows < ActiveRecord::Migration[5.1]
  def change
    add_column :tv_shows, :winning_bid, :decimal
    add_column :tv_shows, :winning_bid2, :decimal
    add_column :tv_shows, :winner, :integer
    add_column :tv_shows, :winner2, :integer
    add_column :tv_shows, :bids_counter, :integer
  end
end
