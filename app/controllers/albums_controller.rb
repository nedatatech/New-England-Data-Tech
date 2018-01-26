class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :destroy]

  def show
  	#@collection = Gallery.where(:album_id => params[:id])
    #@galleries = Gallery.where(:album_id => params[:id])
    #@galleries = Gallery.all

  end  

  def index
  	@galleries = Gallery.all
    @albums = Album.all
  end

  def new
  	@album = Album.new
  end

  def create 
  	@album = Album.new(album_params)
    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:name)
    end

end
