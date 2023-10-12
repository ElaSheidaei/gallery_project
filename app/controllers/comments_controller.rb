class CommentsController < ApplicationController
    before_action :authenticate_user!
    def create
        @comment = current_user.comments.new(comment_params)
        if @comment.save
            render json:{massages: "comment created ", comment: @comment}, status: 201
        else
            render json: {error: @comment.errors.full_messages}
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
