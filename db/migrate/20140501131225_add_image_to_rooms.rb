class AddImageToRooms < ActiveRecord::Migration
  def change
  	# to upload paperclip gem
  	add_attachment :rooms, :image

  end
end
