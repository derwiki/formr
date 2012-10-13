class Answer < ActiveRecord::Base
  attr_accessible :question_id, :text
  belongs_to :question
  validates_presence_of :question_id
  validates_presence_of :text

  def response_percent
    @_response_stats ||= self.question.response_stats
    @_response_stats[id] || 0
  end
end
