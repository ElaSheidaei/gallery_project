class ReactionsController < ApplicationController
    before_action :authenticate_user!, :except => [:index, :show]

    def index
        @gallery = Gallery.find(params[:gallery_id])
        @reaction = @gallery.reactions
    end

    def show 
        # @gallery = Gallery.find(params[:gallery_id])
        # @reaction = @gallery.reactions.where(User_id: current_user.id)
        @reaction = Reaction.find(params[:id])
    end

    def create
        @gallery = Gallery.find(params[:gallery_id])
        reaction = @gallery.reactions.new(reaction_params) 
        reaction.user = current_user

        if reaction.save
            render json:{ message: "reaction created", reaction: reaction.reaction_type}, status: 201
        else
            render json: {error: reaction.errors.full_messages}, status: 400
        end
        
    end

    def update
        # @gallery = Gallery.find(params[:gallery_id])
        # reaction = current_user.reactions.where(gallery: @gallery)
        reaction = current_user.reactions.where(gallery_id: params[:gallery_id])
        if reaction.update(reaction_params)
            render json:{ message: "reaction updated"}, status: 201
        else
            render json: {error: reaction.errors.full_messages}, status: 400
        end
    end

    def destroy 
        @gallery = Gallery.find(params[:gallery_id])
        reaction = @gallery.reactions.where(user_id: current_user.id)

        if reaction.destroy
            render json:{ massage: "reaction deleted"}, status: 201
        else
            render json:{ error: "deletetion failed "}, status: 400
        end
    end

    private

    def reaction_params
        params.require(:reaction).permit(:reaction_type)
    end

end
