class League < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :teams, dependent: :destroy
  has_many :players, through: :teams
  validates :name, uniqueness: true, presence: true
  validates :country, presence: true
  validates :city, presence: true
end
