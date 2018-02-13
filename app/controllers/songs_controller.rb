class SongsController < ApplicationController

  get '/songs/new' do
    @artist = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug]).first
    erb :'songs/show'
  end

  post :'/songs' do

    @song = Song.create(params[:song])

    if !params[:artist_name].empty?
      @artist = Artist.create(name: params[:artist_name])
    end

    @artist = Artist.find_by(name: params[:artist_name])



    params[:song][:artist] = @artist
    binding.pry
    redirect to '/songs/#{@song.slug}'

  end

end
