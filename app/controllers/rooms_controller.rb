class RoomsController < ApplicationController


	# I want to do a check before certain actions happen (can only see certain pages unless loged in)
	before_action :make_sure_logged_in,
		only: [:new, :create, :edit, :update, :destroy]


		def index
			# this is the homepage
			@rooms = Room.all
		end


		def show
			# this is an individual room
			@room = Room.find(params[:id])
		end

		def new
			# add a new room form
			@room = current_user.rooms.new
		end

		def create
			# actually add the room to the database
			@room = current_user.rooms.new(room_params)

			if @room.save
				flash[:success] = "You've added this room"
				redirect_to room_path(@room)
			else
				render "new"
			end
				
		end

		def edit

			# form for editing the room
			@room = current_user.rooms.find(params[:id])
		end

		def update

			# actually update the database
			@room = current_user.rooms.find(params[:id])

			if @room.update(room_params)
				flash[:success] = "The room has been updated"
				redirect_to room_path(@room)
			else
				render "edit"
			end
		end

		def destroy
			# actually delete the room from the database
			@room = current_user.rooms.find(params[:id])

			@room.destroy

			flash[:success] ="The room has been deleted :("

			redirect_to root_path
		end


		def room_params
			# make sure the form data isnt hacked
			params.require(:room).permit(:name, :address, :description,
				:number_of_guests, :image)
		end



	end
