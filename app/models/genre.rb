class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs 

    def slug(name)
        name.gsub(/\s+/, '-')
    end 

    #replace a dash with a space 
    def self.find_by_slug(name)
        name.gsub(/\-+/, ' ')
    end
end