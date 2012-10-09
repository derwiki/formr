class Question < ActiveRecord::Base
  attr_accessible :text, :form_id
  has_many :answers
  belongs_to :form
end
