class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :email, uniqueness: true


  has_many :owned_projects, class_name: Project, foreign_key: 'owner_id', dependent: :destroy
  has_many :pledged_projects, through: :pledges, class_name: Project, foreign_key: 'project_id'
  has_many :pledges, foreign_key: 'backer_id', dependent: :destroy
  has_many :rewards, through: :pledges
  has_many :comments


end
