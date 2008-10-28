require 'fileutils'

IBOX_PATH = "#{RAILS_ROOT}/vendor/plugins/ibox-rails-plugin"
PUBLIC_PATH = "#{RAILS_ROOT}/public"

desc 'Copies all Ibox files to app directories'
task :install_ibox do
  ibox_public_path = File.join(PUBLIC_PATH,"javascripts/ibox")
  css_public_path = File.join(PUBLIC_PATH,"stylesheets/ibox")
  Dir.mkdir(ibox_public_path) unless File.exists?(ibox_public_path)
  Dir.mkdir(css_public_path) unless File.exists?(css_public_path)
  
  ibox_js, public_js = Dir.glob(File.join(IBOX_PATH,"javascripts","*.js")),  File.join(PUBLIC_PATH,"javascripts/ibox")
  ibox_css, public_css = Dir.glob(File.join(IBOX_PATH,"stylesheets","*.css")), File.join(PUBLIC_PATH, "stylesheets/ibox")
  ibox_images, public_images = Dir.glob(File.join(IBOX_PATH, "images", "*.gif")), File.join(PUBLIC_PATH, "images")
  
  FileUtils.cp_r(ibox_images, public_images)
  FileUtils.cp_r(ibox_js,public_js)
  FileUtils.cp_r(ibox_css, public_css)
  puts "All Javascript and CSS Files have been copied into your public folders..."
  puts "=="
  puts "Simply add <%= iboxify_page => to your layout head and you are as good as gold..."
end