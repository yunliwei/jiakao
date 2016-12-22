class User < ActiveRecord::Base
  has_many :scores
  has_many :loginlogs
  has_many :errquests
end
