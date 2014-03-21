set :haml, { attr_wrapper: '"', format: :html5 }
set :css_dir, 'css'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :livereload

configure :build do
  activate :minify_css
  activate :asset_hash
  activate :relative_assets
end

