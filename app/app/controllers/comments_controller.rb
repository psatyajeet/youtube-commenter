class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
      	if @comment.save
        	redirect_to @comment.video
      	end
	end

	def show
       @comment = Comment.find(params[:id])
   	end

	private
	
	def comment_params
		params.require(:comment).permit(:video_id, :body)
	end

end
