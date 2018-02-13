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

  post '/songs' do
    @song = Song.create(params[:song])
    @artist = Artist.find_by(name: params[:artist_name])
    @song.artist = !@artist ? Artist.create(name: params[:artist_name]) : @artist
    @song.save
    redirect "/songs/#{@song.slug}"
  end

end
