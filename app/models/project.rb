class Project < ActiveRecord::Base
  validates_presence_of :name, :end_date, :funding_goal, :description

  belongs_to :owner, class_name: 'User'
  has_many :backers, through: :pledges, class_name: 'User', foreign_key: 'backer_id'
  has_many :pledges
  has_many :rewards
  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true
  has_many :pledges, dependent: :destroy
  has_many :rewards, dependent: :destroy
  has_and_belongs_to_many :tags

  def add_tag(tag)
    self.tags << tag unless self.tags.include?(tag)
  end

  def days_remaining
    ((self.end_date.end_of_day - Time.now.beginning_of_day) / 86400).to_i
  end
end
