class Question < ActiveRecord::Base
  attr_accessible :text, :form
  has_many :answers
  belongs_to :form
  validates_presence_of :form
  validates_presence_of :text

  # returns hash of {answer_id: percent_response}
  def response_stats
    #TAGS: group groupby histogram
    choices = Choice.where(question_id: self).group(:answer_id).count
    response_count = choices.sum { |_, count| count }.to_f
    choices.each { |k, v| puts v; choices[k] = v / response_count }
  end
end
