class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres 
    has_many :genres, through: :song_genres
    
    def slug(name)
        name.gsub(/\s+/, '-')
    end 

    #replace a dash with a space 
    def self.find_by_slug(name)
        name.gsub(/\-+/, ' ')
    end


    
end