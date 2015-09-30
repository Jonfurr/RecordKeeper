namespace :db do
	desc "Erase and fill database"
	task :populate => :environment do
		require 'populator'

		[User, Album].each(&:delete_all)

		User.populate 20 do |user|
			user.name = Populator.words(2)
			user.email = Populator.words(1)
			user.pic_url = Populator.words(1)
			user.favorite = Populator.words(1)
			user.crypted_password = Populator.words(1)
			user.salt = Populator.words(1)
			user.created_at = 2.years.from_now..Time.now
			user.updated_at = 2.years.from_now..Time.now
			Album.populate 20 do  |album|
				album.artist = Populator.words(2)
				album.year = 1800..2015
				album.title = Populator.words(2)
				album.pressing = Populator.words(2)
				album.format = Populator.words(2)
				album.label = Populator.words(2)
				album.genre = Populator.words(2)
				album.image_url = Populator.words(2)
				album.tracklist = Populator.words(2)
				album.country = Populator.words(2)
				album.comment = Populator.words(2)
				album.favorite = Populator.words(2)
				album.created_at = 2.years.from_now..Time.now
				album.updated_at = 2.years.from_now..Time.now
				album.user_id = 2..20
			end

		end

	end
end	