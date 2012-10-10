class Answer < ActiveRecord::Base
  attr_accessible :question_id, :text
  belongs_to :question
  validates_presence_of :question_id
  validates_presence_of :text
end
