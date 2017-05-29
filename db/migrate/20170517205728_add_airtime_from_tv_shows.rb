class AddAirtimeFromTvShows < ActiveRecord::Migration[5.1]
  def change
    add_column :tv_shows, :airtime, :text, default: "{:start => [0,0], :end => [1,0]}"
  end
end
