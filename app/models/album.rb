class Album < ActiveRecord::Base
<<<<<<< HEAD
	 belongs_to :user
=======
	 belongs_to :customer

		def self.search(search)
  		# where("title ILIKE ?", "%#{search}%")
  		# where("artist ILIKE ?", "%#{search}%")
  		# where("genre ILIKE ?", "%#{search}%")

  		Album.where('title ILIKE :search OR genre ILIKE :search OR artist ILIKE :search', search: "%#{search}%")
	end
>>>>>>> bb3a46ab3d1f62c54c1738ff9e417feb8e3c72a6
end
