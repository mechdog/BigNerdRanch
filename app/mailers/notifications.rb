class Notifications < ActionMailer::Base
  default :from => "test@mechdog.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.widget_creation.subject
  #
  def widget_creation(widget)
    @widget = widget

    mail :to => "mark@mechdog.com"
  end
end
