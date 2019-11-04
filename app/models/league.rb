class League < ApplicationRecord
  has_many :teams, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  validates :country, presence: true
  validates :city, presence: true
end
