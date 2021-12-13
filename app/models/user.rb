class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :memberships
  has_many :rooms, through: :memberships
  has_many :messages

  after_create :join_first_room

  def join_first_room
    Membership.create(room_id: 1, user_id: self.id)
  end
end
