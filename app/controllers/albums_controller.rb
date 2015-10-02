class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_login, :except => [:albums]

  # GET /albums
  # GET /albums.json

def index

  if params[:search]
    @albums = Album.search(params[:search]).order("created_at DESC")
  else
    @albums = Album.take(10)
  end

  end


  # GET /albums/1
  # GET /albums/1.json
  def show
    @album = Album.joins('LEFT OUTER JOIN users ON albums.user_id = users.id').find(params[:id])


    # LEFT OUTER JOIN addresses ON addresses.client_id = clients.id'
    # @added_by = User.joins('LEFT OUTER JOIN albums ON albums.id = @album')
  end

  
 
   
  # end
  # GET /albums/new
  def new
    @album = Album.new
    
  end

  # GET /albums/1/edit
  def edit

  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(album_params.merge(user_id: current_user.id))

    @album.image_url
    @album.image_url = "/assets/default_album.png" if @album.image_url.empty?
  
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

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
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
      params.require(:album).permit(:artist, :year, :title, :pressing, :label, :genre, :format, :image_url, :tracklist, :country, :comment, :favorite)
    end
  end

