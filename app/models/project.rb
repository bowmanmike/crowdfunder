class Project < ActiveRecord::Base
  validates_presence_of :name, :end_date, :funding_goal, :description

  belongs_to :owner, class_name: 'User'
  has_many :backers, through: :pledges, class_name: 'User', foreign_key: 'backer_id'
  has_many :pledges
  has_many :rewards
  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true
  has_many :pledges, dependent: :destroy
  has_many :rewards, dependent: :destroy
end
