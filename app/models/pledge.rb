class Pledge < ActiveRecord::Base

  validates_presence_of :amount

  belongs_to :backer, class_name: 'User'
  belongs_to :project
  belongs_to :reward
end
