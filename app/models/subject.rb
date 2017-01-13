class Subject < ActiveRecord::Base
  belongs_to :question
  has_many :clas
end
