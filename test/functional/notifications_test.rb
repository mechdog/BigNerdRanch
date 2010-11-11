require 'test_helper'

class NotificationsTest < ActionMailer::TestCase
  test "widget_creation" do
    mail = Notifications.widget_creation
    assert_equal "Widget creation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
