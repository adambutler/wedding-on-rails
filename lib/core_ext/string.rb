require 'kramdown'

class String
  def from_markdown_to_html
    Kramdown::Document.new(self).to_html
  end
end
