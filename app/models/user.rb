class User < ActiveRecord::Base
  has_many :scores
  has_many :loginlogs
end
