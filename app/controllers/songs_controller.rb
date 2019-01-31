class SongsController < ApplicationController

    get '/songs' do
        @songs=Song.all
        erb :"/songs/index"
    end

    get '/songs/new' do
        @genres=Genre.all
        erb :"/songs/new"
    end

    post '/songs' do
        # if !params["artist"]["name"].empty?
        #     artist=Artist.create(params["artist"])
        # end

        song = Song.create(name: params[:song][:name].strip)
        
        # binding.pry
        song.artist =Artist.find_or_create_by(name: params[:artist_name])
    
        # binding.pry
            # if !params["song"]["genre_ids"].empty?
            params[:genre_ids].each do |genre_id|
                song.genres << Genre.find(genre_id)
            end
        # end
        song.save
        redirect to "/songs/#{song.name}"
    end

    get '/songs/:slug' do
        #  binding.pry
        name=Song.find_by_slug(params[:slug])
        @song=Song.find_by(name: name)
        #    binding.pry
        erb :"/songs/show"
    end
end