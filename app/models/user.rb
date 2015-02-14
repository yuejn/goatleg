class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #validates :eaten_goatleg, presence: true
  #validates :eaten_goatleg, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable
  
  # You'd, probably, want to have a separate name column instead
  def name
    email
  end

  def mailboxer_email(object)
    email
  end
  has_one :profile
  has_many :trips
  has_many :messages
  accepts_nested_attributes_for :profile
  after_create :add_profile

  def add_profile
    Profile.create(user_id:self.id)
  end
end