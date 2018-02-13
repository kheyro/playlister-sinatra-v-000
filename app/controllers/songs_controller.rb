class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug]).first
    # binding.pry
    erb :'songs/show'
  end

  get '/songs/new' do
    @artists = Artist.all
    erb :'songs/new'
  end
  
  post :'/songs' do

  end

end
