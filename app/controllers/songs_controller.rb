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
    # Artist.create(name: "Person with a Face")
    @song = Song.create(params[:song])
    # if !params[:artist_name].empty?
      # @song.artist = Artist.create(name: "Person with a Face")
    # end
    binding.pry
    @song.save
    redirect '/songs/#{@song.slug}'
  end

end
