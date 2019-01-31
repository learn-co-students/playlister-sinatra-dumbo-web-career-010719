class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    @artists = Artist.all
    erb :'/songs/new'
  end

  post '/songs' do
    artist = Artist.find_or_create_by(params["artist"])
    song = Song.create(params["song"])
    artist.songs << song
    redirect to ("/songs/#{song.slug}")
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @genres = @song.genres
    @artist = @song.artist
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params["song"])
    redirect to ("/songs/#{@song.slug}")
  end

  delete '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.destroy
    redirect to ("/songs")
  end

end
