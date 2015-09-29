class Album < ActiveRecord::Base
	 belongs_to :customer

		def self.search(search)
  		# where("title ILIKE ?", "%#{search}%")
  		# where("artist ILIKE ?", "%#{search}%")
  		# where("genre ILIKE ?", "%#{search}%")

  		Album.where('title ILIKE :search OR genre ILIKE :search OR artist ILIKE :search', search: "%#{search}%")
	end
end
