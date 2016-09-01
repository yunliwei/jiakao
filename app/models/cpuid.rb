class Cpuid < ActiveRecord::Base

  has_many :licenses,:dependent => :destroy

end
