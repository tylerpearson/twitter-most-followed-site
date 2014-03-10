require "rake"
require 'fileutils'

source_dir = "./"

desc "Process LESS into CSS."
task :less do
  FileUtils.mkdir_p 'assets/css/'
  sh "lessc assets/_less/all.less -x > assets/css/site.min.css"
end