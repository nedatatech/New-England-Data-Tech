class GalleriesController < ApplicationController
  #before_action :set_gallery, only: [:show, :destroy]

  def show
  	byebug
  end

  def index 
  	byebug
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  #def set_gallery
  #  @gallery = Gallery.find(params[:id])
  #  byebug
  #end

  # Never trust parameters from the scary internet, only allow the white list through.
  def gallery_params
    params.require(:gallery).permit(:image_id, :album_id)
  end

end
