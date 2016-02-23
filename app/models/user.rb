class User < ActiveRecord::Base
  has_many :owned_projects, class_name: Project, foreign_key: 'owner_id'
  has_many :pledged_projects, class_name: Pledge, foreign_key: 'backer_id'
  has_many :pledges, as: :backer
end
