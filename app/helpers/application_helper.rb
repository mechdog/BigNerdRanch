module ApplicationHelper

### Give a _time+, returns a short date in the format os:
#
#   Oct 22 2010
#
def short_date ( time )
  return if time.nil?
  time.strftime("%b %d %Y")
end




end
