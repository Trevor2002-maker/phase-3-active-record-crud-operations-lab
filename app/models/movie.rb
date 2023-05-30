class Movie < ActiveRecord::Base
    validates_presence_of :title, :release_date, :director, :lead_actor_actress
    validates :in_theaters, inclusion: { in: [true, false] }
  
    def self.create_with_title(title)
      movie = self.new(title: title)
      movie.save
      movie
    end
  
    def self.first_movie
      self.first
    end
  
    def self.last_movie
      self.last
    end
  
    def self.movie_count
      self.count
    end
  
    def self.find_movie_with_id(id)
      self.find(id)
    end
  
    def self.find_movie_with_attributes(attributes)
      self.find_by(attributes)
    end
  
    def self.find_movies_after_2002
      self.where("release_date > ?", Date.new(2002))
    end
  
    def update_with_attributes(attributes)
      self.update(attributes)
    end
  
    def self.update_all_titles(new_title)
      self.update_all(title: new_title)
    end
  
    def self.delete_by_id(id)
      self.delete(id)
    end
  
    def self.delete_all_movies
      self.delete_all
    end
  end