class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :rewards
end
