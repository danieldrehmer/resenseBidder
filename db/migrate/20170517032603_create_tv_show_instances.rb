class CreateTvShowInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :tv_show_instances do |t|
      t.string :name
      t.datetime :airtime
      t.decimal :purchased_cpm
      t.integer :tv_show_id
      t.integer :wallet_id

      t.timestamps
    end
  end
end
