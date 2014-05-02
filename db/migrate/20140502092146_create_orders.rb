class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

    	# I want there to be two associations with order
    	# order belongs to a room, and order belongs to a user
    	t.integer :room_id
    	t.integer :user_id
    	# This will be the reference on strope.com to which credit card
    	t.string :stripe_token
    	# token is like an id, with a big string of random numbers and letters


      t.timestamps
    end
  end
end
