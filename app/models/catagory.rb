class Catagory < ActiveRecord::Base
  has_many :catagorizations
  has_many :widgets, :through => :catagorizations
end
