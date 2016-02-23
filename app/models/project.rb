class Project < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :backers, through: :pledges, class_name: 'User', foreign_key: 'backer_id'
  has_many :pledges
end
