class Reward < ActiveRecord::Base
  belongs_to :project
  has_many :pledges
  has_many :backers, through: :pledges, class_name: User

  # method to check whether a reward is still available
  def available?(reward)
    reward.pledges < reward.number_available
  end

end
