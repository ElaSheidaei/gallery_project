class GalleriesController < ApplicationController
    before_action :authenticate_user!, :except => [:index, :show]
    def index
        @galleries = Gallery.all
    end

    def show
        @gallery = Gallery.find(params[:id])
    end

    def new 
        @gallery = Gallery.new
    end

    def create
        @gallery = Gallery.new(gallery_params)
        current_user.galleries << @gallery

        if @gallery.save
            # redirect_to galleries_path
            render json:{massages: "gallery created ", gallery: @gallery}, status: 201
        else 
            render :new, status: :unprocessable_entity
        end 
    end

    def edit
        # @gallery = Gallery.find(params[:id])
        @gallery = current_user.galleries.find(params[:id])
    end

    def update
        # @gallery = Gallery.find(params[:id])
        @gallery = current_user.galleries.find(params[:id])

        if @gallery.update(gallery_params)
            redirect_to galleries_path
        else 
            render :edit, status: :unprocessable_entity
        end 
    end

    def destroy
        # @gallery = Gallery.find(params[:id])
        @gallery = current_user.galleries.find(params[:id])
        @gallery.destroy

        redirect_to galleries_path
    end
    
    private
        def gallery_params
            params.require(:gallery).permit(:title, :description, :image )
        end

end
