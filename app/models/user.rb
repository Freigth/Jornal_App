class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable
  # :recoverable, :rememberable, :validatable

  validates :email, presence: true, length:{ minimum: 2 }
  validates :password, presence: true, length:{ minimum: 6 }

  has_many :categories
  has_many :tasks, through: :categories
end
