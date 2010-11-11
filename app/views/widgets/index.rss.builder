xml.instruct! :xml, :version => "1.0"
xml.rss(:version=>"2.0"){
  xml.channel{
    xml.title("Bitching Widget Feed")
    xml.link("http://mywidgets.com/")
    xml.description("Some awesome wdigets, no DROIDS here...")
    xml.author("Steve Jobs")
    xml.language('en-us')
    for widget in @widgets
      xml.item do
        xml.title(widget.name)
        xml.descriptions("A bitchin widget named #{widget.name}")
        xml.author("Steve")
        xml.pubDate(widget.created_at.strftime"%a, %d %b %Y %H:%M:%S %z")
        xml.link(url_for(:controller => 'widgets', :action => 'show', :id => widget.id, :only_path => false))
        xml.guid(url_for(:controller => 'widgets', :action => 'show', :id=> widget.id, :only_path => false))
      end
    end
  }
}