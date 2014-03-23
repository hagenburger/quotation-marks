set :haml, { attr_wrapper: '"', format: :html5 }
set :css_dir, 'css'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true

activate :livereload

configure :build do
  activate :minify_css
  activate :asset_hash
  activate :relative_assets
end

