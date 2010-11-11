class Box < ActiveRecord::Base
  belongs_to :order
  has_one :widget
  
  validates :color, :presence=>true,
                :uniqueness=>true
                
  def description
    "A "+self.color+" "+self.material+" box."
  end
  
  def self.not_on_orders
     self.where("order_id IS NULL")
  end
  
end
