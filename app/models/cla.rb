class Cla < ActiveRecord::Base
  has_many :classdetails
  belongs_to :subject
end
