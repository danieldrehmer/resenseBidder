class CreateTvShows < ActiveRecord::Migration[5.1]
  def change
    create_table :tv_shows do |t|
      t.string :name
      t.datetime :airtime
      t.decimal :cpm

      t.timestamps
    end
  end
end
