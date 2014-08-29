class VideosController < ApplicationController

	def show
		@video = Video.find(params[:id])
		@comments = @video.comments
		@youtube_id = /.*watch\?v=(.*)/.match(@video.url)
		logger.info @youtube_id
	end

	def search
		@video = Video.new
	end

	def create
		@video = Video.where(url: video_params[:url]).first
		if @video
			redirect_to @video
		else
			@video = Video.new(video_params)
			if @video.save
				flash[:success] = "Video added"
				redirect_to @video
			else
				render 'new'
			end
		end
	end

	private

	def video_params
		params.require(:video).permit(:url)
	end

	def parse_video_url(url)

	end

end
