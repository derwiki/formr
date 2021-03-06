class Form < ActiveRecord::Base
  attr_accessible :creator_id, :creator, :name
  has_many :questions
  has_many :responses
  belongs_to :creator, class_name: 'User'
end
