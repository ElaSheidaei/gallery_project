class UploadController < ApplicationController
    before_action :authenticate_user!

    def update
        # @gallery = Gallery.find(params[:gallery_id])
        @gallery = current_user.galleries.find(params[:gallery_id])
        @gallery.image.attach(params.require(:image))

        render json: { url: url_for(@gallery.image)}, status: 200
    end
end
