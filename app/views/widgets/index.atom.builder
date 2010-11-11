# app/views/widgets/index.atom.builder
atom_feed do |feed|
  feed.title "MyATOM data feed"
  feed.updated((@widgets.first.created_at))
  
  for widget in @widgets
    feed.entry(widget) do |entry|
      entry.title(widget.name)
      entry.content(widget.description, :type => 'html')
      entry.author do |author|
        author.name("Big Geek Project")
      end
    end
  end
end