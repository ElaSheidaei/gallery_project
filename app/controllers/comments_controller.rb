class CommentsController < ApplicationController
    before_action :authenticate_user!, :except => [:index, :show]

    def index
        @gallery = Gallery.find(params[:gallery_id])
        @comment = @gallery.comments
    end

    def show
        # @comment = current_user.comments.find_by(gallery_id: params[:gallery_id] )
        @comment = Comment.find(params[:id])
    end
    def create
        @comment = current_user.comments.new(comment_params)
        if @comment.save
            render json:{massages: "comment created ", comment: @comment}, status: 201
        else
            render json: {error: @comment.errors.full_messages}, status: 400
        end
    end

    def destroy
        @comment = current_user.comments.find(params[:id])
        @comment.destroy
    end


    private
    
    def comment_params
        params.require(:comment).permit(:content).merge(gallery_id: params[:gallery_id])
    end
end
