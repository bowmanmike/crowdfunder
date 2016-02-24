class Pledge < ActiveRecord::Base

  validates_presence_of :amount

  belongs_to :backer, class_name: 'User', dependent: :destroy
  belongs_to :project, dependent: :destroy
  belongs_to :reward, dependent: :destroy
end
