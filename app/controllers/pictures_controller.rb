class PicturesController < ApplicationController

	def index
		find_pictures
	end

	def new
		@picture = Picture.new
	end

	def create
		file = params[:picture][:url]
		hash = Cloudinary::Uploader.upload(file)
		new_url = hash["secure_url"]
		@picture = Picture.new
		@picture.url = new_url
		@picture.save
		redirect_to root_path
	end

	private

	def picture_params
		params.require(:picture).permit(:url)
	end

	def find_pictures
		@pictures = Picture.all
	end

end
