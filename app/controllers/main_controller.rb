class MainController < ApplicationController
  def index
    @galleries = Gallery.all 
  end
end
