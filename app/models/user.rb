class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :forms
  has_many :responses
  validates_presence_of :email
  validates_presence_of :name
end
