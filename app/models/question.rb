class Question < ActiveRecord::Base
  attr_accessible :text, :form
  has_many :answers
  belongs_to :form
  validates_presence_of :form
  validates_presence_of :text
end
