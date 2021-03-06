class Response < ActiveRecord::Base
  attr_accessible :form, :user, :form_id, :user_id
  has_many :choices
  belongs_to :form
  belongs_to :user
  validates_presence_of :form
  validates_presence_of :user
end
