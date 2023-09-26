class UploadController < ApplicationController

    def update
        @gallery = Gallery.find(params[:gallery_id])
        @gallery.image.attach(params.require(:image))

        render json: { url: url_for(@gallery.image)}, status: 200
    end
end
