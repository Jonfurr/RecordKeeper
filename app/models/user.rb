class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

	def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end  
	
  has_many :albums, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }
  validates :email, uniqueness: true


  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

end