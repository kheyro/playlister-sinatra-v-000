class SongsController < ApplicationController

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug]).first
    # binding.pry
    erb :'songs/show'
  end

  post :'/songs' do
    @artist = Artist.find_by(params[:artist_name])

    if !@artist 
      @artist = Artist.create(params[:artist_name])
    
    @song = Song.create(params[:song])
    
  end

end
