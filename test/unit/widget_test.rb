require 'test_helper'

class WidgetTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "validations" do
    #failure - needs a name and size
    widget=Widget.new()
    assert_equal false, widget.valid?
    
    #failure -needs size
    widget = Widget.new(:name=>"Fire Widget")
    assert_equal false, widget.valid?
    
    #success
    widget = Widget.new(:name => "Fire Widget", :size=>5)
    assert_equal true, widget.valid?
    
  end
end
