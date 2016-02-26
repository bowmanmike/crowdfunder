class Comment < ActiveRecord::Base
  validates_presence_of :message

  belongs_to :project
  belongs_to :user
end
