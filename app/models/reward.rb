class Reward < ActiveRecord::Base
  validates_presence_of :name, :price, :description, :number_available

  belongs_to :project
  has_many :pledges, dependent: :destroy
  has_many :backers, through: :pledges, class_name: User

  # method to check whether a reward is still available
  def available?
    self.pledges.count < self.number_available
  end

end
