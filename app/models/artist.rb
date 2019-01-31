class Artist < ActiveRecord::Base
    has_many :songs 
    has_many :genres, through: :songs

    #replace a space with a dash
    def slug(name)
        name.gsub(/\s+/, '-')
    end 

    #replace a dash with a space 
    def self.find_by_slug(name)
        name.gsub(/\-+/, ' ')
    end
end