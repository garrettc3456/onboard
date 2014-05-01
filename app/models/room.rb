class Room < ActiveRecord::Base

	# associations



	# validations
	validates :name, presence: true
	validates :address, presence: true
	validates :number_of_guests, presence: true, numericality: {greater_than: 0}


	# plugins
	geocoded_by :address
	after_validation :geocode


	# paper clip
	# 960x400#  will  crop the image to 960 by 400
	# 500x    wil make the image 500px wide
	#  x400    will make the image 400px high
	# 960x400    will resize the image to either 960 px wide or 400 high (not crop) note, no hash
	has_attached_file :image, styles: { large: "960x400#",
		medium: "320x200#", thumbnail: "60x60#"}
	# the following line is from the paperclip site, make sure below matches word u used, not avatar
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


	# anything else










end
