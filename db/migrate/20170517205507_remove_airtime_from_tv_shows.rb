class RemoveAirtimeFromTvShows < ActiveRecord::Migration[5.1]
  def change
    remove_column :tv_shows, :airtime, :datetime
  end
end
