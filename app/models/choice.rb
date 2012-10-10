class Choice < ActiveRecord::Base
  attr_accessible :answer, :question, :response
  belongs_to :answer
  belongs_to :question
  belongs_to :response
  validates_presence_of :question_id
  validates_presence_of :answer_id
  validates_presence_of :response_id
end
