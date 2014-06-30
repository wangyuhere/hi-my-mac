require File.expand_path("../boot", __FILE__)

ruby_path = "ruby"
scripts_path = HiMyMac.scripts_path
logs_path = HiMyMac.logs_path

set :job_template, %Q{bash -l -c 'export PATH="$HOME/.rbenv/bin:$PATH"; eval "$(rbenv init -)"; cd #{HiMyMac.path} && :job'}

every 30.minutes do
  command "#{ruby_path} #{scripts_path}/read.rb", output: "#{logs_path}/read.log"
end

every 1.hour do
  command "cd /Users/yuwang/Projects/keywords && bundle exec rake keywords:all", output: "#{logs_path}/keywords_import.log"
end
