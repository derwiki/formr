class Form < ActiveRecord::Base
  attr_accessible :creator_id, :name
  has_many :questions
end
