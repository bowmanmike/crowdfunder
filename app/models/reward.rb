class Reward < ActiveRecord::Base
  validates_presence_of :name, :price, :description, :number_available

  belongs_to :project
  has_many :pledges, dependent: :destroy
  has_many :backers, through: :pledges, class_name: User
end
