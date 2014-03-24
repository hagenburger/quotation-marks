set :haml, { attr_wrapper: '"', format: :html5 }
set :css_dir, 'css'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true

activate :livereload

configure :build do
  activate :minify_css
  activate :asset_hash
  activate :relative_assets
end

helpers do
  def gem_version
    # Prefer `git tag` over version.rb as tags are released:
    versions = `cd .. && git tag`.split(/\n/)
    current  = versions.last
    current.sub(/^v/, '')
  rescue
    '0.0.0'
  end

  def markdown(source)
    renderer = Redcarpet::Markdown.new(RedcarpetHTML, fenced_code_blocks: true)
    renderer.render(source)
  end
end

class RedcarpetHTML < ::Redcarpet::Render::HTML
  def block_code(code, language)
    if language == 'html'
      code = ERB::Util.html_escape(code)
    elsif language
      language = 'css' if language == 'scss'
      code = ::MiniSyntax.highlight(code, language)
    end
    %Q(<pre><code>#{code}</code></pre>)
  end
end

