module ApplicationHelper
  def markdown(text, name)
    options = {
      filter_html:     true,
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    # Do the image thing

    text = text.gsub('public/images/shared', "https://github.com/artsy/#{name}/raw/master/public/images/shared")
    text = text.gsub('app/assets/images/embed', "https://github.com/artsy/#{name}/raw/master/app/assets/images/embed")
    text = text.gsub('doc/images', "https://github.com/artsy/#{name}/raw/master/doc/images")
    # text = text.gsub('images/', "https://github.com/artsy/#{name}/raw/master/images/")
    
    # Remove this weird markdown
    text = text.gsub(' &quot;Artsy&quot;', '')
    markdown.render(text).html_safe
  end
end
