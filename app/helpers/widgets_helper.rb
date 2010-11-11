module WidgetsHelper
  
  def box_options
    Box.all.collect {|b| [b.color, b.id]}
  end
  
end
