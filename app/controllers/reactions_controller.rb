class ReactionsController < ApplicationController
    before_action :authenticate_user!

    def create
        @gallery = Gallery.find(params[:gallery_id])
        reaction = @gallery.reactions.new(reaction_params) 
        reaction.user = current_user

        if reaction.save
            render json:{ message: "reaction created", reaction: reaction.reaction_type}, status: 201
        else
            render json: {error: reaction.errors.full_messages}
        end
        
    end


    private

    def reaction_params
        params.require(:reaction).permit(:reaction_type)
    end

end
