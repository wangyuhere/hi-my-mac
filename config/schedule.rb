require File.expand_path("../boot", __FILE__)

ruby_path = "ruby"
scripts_path = HiMyMac.scripts_path
logs_path = HiMyMac.logs_path

set :job_template, %Q{bash -l -c 'export PATH="$HOME/.rbenv/bin:$PATH"; eval "$(rbenv init -)"; cd #{HiMyMac.path} && :job'}

every 10.minutes do
  command "#{ruby_path} #{scripts_path}/read.rb", output: "#{logs_path}/read.log"
end
