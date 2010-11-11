class Widget < ActiveRecord::Base
  belongs_to :box
  has_many :catagorizations
  has_many :catagories, :through => :catagorizations
    
  validates :name, :presence=> true,
                    :length => {:minimum => 3}
  validates :size, :numericality => true
  
  # validates :color, :inclusion => %w(red white blue) 
  
    AMERICAN_COLORS = %w(red white blue)

    # /(red|white|blue)/i
    validate :must_be_american

    def must_be_american
      if self.color && !AMERICAN_COLORS.include?(self.color.downcase)
        errors.add(:color, " has to be american #{AMERICAN_COLORS.to_sentence}, bitch....")
      end
    end
 
  
  def self.monthly_special
   self.first
    # widget_count = Widget.count
    # rand_widget_id = rand(widget_count)+1
    # Widget.find(rand_widget_id)
  end
  
  def need_update?(compareto)
    if (self.name==compareto.name && self.size==compareto.size)
      return false
    else
      return true
    end
  end
  
  def <=>(compareto) 
    self.name<=>compareto.name
  end
  
end
