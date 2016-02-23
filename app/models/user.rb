class User < ActiveRecord::Base
  has_many :owned_projects, class_name: Project, foreign_key: 'owner_id'
  has_many :pledged_projects, through: :pledges, class_name: Project, foreign_key: 'project_id'
  has_many :pledges, foreign_key: 'backer_id'
end
