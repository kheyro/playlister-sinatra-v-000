class SongsController < ApplicationController

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post :'/songs' do
    @song = Song.create(params[:song])
    # if !params[:artist_name].empty?
      @artist = Artist.create(name: params[:artist_name])
      @artist.save
      @song.artist = @artist
      
    # end
    binding.pry
    @song.save
    redirect '/songs/#{@song.slug}'
  end

end
