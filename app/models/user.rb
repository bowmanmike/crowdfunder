class User < ActiveRecord::Base
  has_many :owned_projects, class_name: Project, foreign_key: 'owner_id'
  # has_many

end
