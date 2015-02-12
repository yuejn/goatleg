class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #validates :eaten_goatleg, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

<<<<<<< HEAD
  has_one :profile
=======
  has_many :trips
  has_many :messages
  has_one :profile

>>>>>>> ab912d49230cacb6beb344d965eb96c2240f1dd8
end
