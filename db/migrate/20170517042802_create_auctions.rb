class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.string :active_users
      t.datetime :start_time
      t.integer :duration
      t.integer :bid_counter

      t.timestamps
    end
  end
end
