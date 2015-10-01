class User < ActiveRecord::Base
  authenticates_with_sorcery!
	has_many :albums, dependent: :destroy
authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }
  validates :email, uniqueness: true

  # def self.search(search)
  # 	User.where('email ILIKE :search', seacrh: "%#{search}%")
  # end
end
