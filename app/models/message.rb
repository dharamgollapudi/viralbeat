class Message < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :title, :body

  validates :user, :presence => true
  validates :title, :presence => true
  validates :body, :presence => true
end