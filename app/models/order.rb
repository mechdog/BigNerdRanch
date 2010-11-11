class Order < ActiveRecord::Base
  has_many :boxes
end
