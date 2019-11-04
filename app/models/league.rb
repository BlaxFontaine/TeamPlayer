class League < ApplicationRecord
  has_many :teams, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  validates :country
  validates :city
end
