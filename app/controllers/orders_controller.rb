class OrdersController < ApplicationController

	# I want to be logged in for ANY area of the orders section
	before_action :make_sure_logged_in
		# he made up the make-sure_logged_in part
		# actions are what happens when you do anything, eg new, create, etc 7 acitons
		# eg, before we do new, it will make us log in


		def new
			# place a new order form
			@room = Room.find(params[:room_id])
			# he is making a new variable called order. on the room we just found (above)
			# the room has many orders and we ant to make a new order
			@order = @room.orders.new
			# to add the current use to the order
			@order.user = current_user
			# could put other features such as @order.starting_at = Time.now
		end

		def create
			# This is actually charging the customer
			@room = Room.find(params[:room_id])
			@order = @room.orders.new(order_params)
			@order.user = current_user

			if @order.save

				# charge them with stripe
				Stripe::Charge.create(amount: 100, currency: "gbp",
					card: @order.stripe_token, description: "Onboard order")

				# To set up a subscription plan,
				# Stripe::Customer.create(card: @order.stripe_token, plan: "silver",
						# description: "Onboard subscription")

				flash[:success] = "You've ordered this room"
				redirect_to room_path(@room)
			else
				render "new"
			end

		end

		def order_params
			# whitelist the form data
			params.require(:order).permit(:stripe_token)
		end



end
