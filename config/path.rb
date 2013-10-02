
module HiMyMac
  def self.rbenv_path
    "#{ENV['HOME']}/.rbenv/bin"
  end

  def self.path
    "#{ENV['HOME']}/Projects/hi-my-mac"
  end

  def self.method_missing(method, *args, &block)
    match = method.to_s.match(/(\w+)_path/)
    if match
      dir_name = match.captures[0]
      File.join(path, dir_name).tap do |p|
        raise "#{p} doesn't exist" unless File.exists?(p)
      end
    else
      super(method, *args, &block)
    end
  end
end
