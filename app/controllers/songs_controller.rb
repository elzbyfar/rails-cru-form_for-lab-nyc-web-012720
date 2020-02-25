class SongsController < ApplicationController
    
    def index 
        @songs = Song.all
    end 

    def new
        @song = Song.new
    end 

    def edit
        @song = Song.find(params[:id])
    end 
    
    def create 
        @song = Song.create(song_params)
        redirect_to @song
    end 

    def update
        @song = Song.find(params[:id])
        @song.update(song_params)
        redirect_to songs_path
    end 

    def show
        @song = Song.find(params[:id])
        @genre = @song.genre
        @artist = @song.artist
    end 

    private

    def song_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end


end 