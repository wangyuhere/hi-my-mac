require 'nokogiri'
require 'open-uri'
require 'fileutils'
require 'yaml'
require 'terminal-notifier'

require File.expand_path("../../config/boot", __FILE__)

class BooksUpdater
  def initialize(path, ids)
    @path = path
    @ids = ids
  end

  def update
    @ids.each { |i| update_book(i) }
    puts "updated at #{Time.now}"
  end

  private

  def book_url(id)
    "http://www.fftxt.net/book/#{id}/"
  end

  def chapter_url(id, href)
    "#{book_url(id)}#{href}"
  end

  def book_file(id)
    File.join @path, id.to_s
  end

  def later_chapter?(ch1, ch2)
    return true if ch2.nil?
    return false if ch1.nil?
    id1 = ch1[:href][/\d+/].to_i
    id2 = ch2[:href][/\d+/].to_i
    id1 > id2
  end

  def notify_new_chapters(id, list)
    return unless File.exists?(book_file(id))

    old_list = YAML.load_file(book_file(id))
    last_chapter = old_list.last unless old_list.nil?

    notify_count = 0
    list.reverse_each do |l|
      break unless later_chapter?(l, last_chapter)
      TerminalNotifier.notify("new: #{l[:title]}", open: chapter_url(id, l[:href]))
      notify_count += 1
      break if notify_count > 5
    end
  end

  def update_book(id)
    doc = Nokogiri::HTML(open(book_url(id), 'r:GBK'), nil, 'GBK')
    list = doc.css('ul#chapterlist li a').map { |a| {title: a.attribute('title').to_s, href: a.attribute('href').to_s} }
    notify_new_chapters(id, list)
    file = open(book_file(id), 'w')
    file.write(list.to_yaml)
  end

end

if __FILE__ == $0
  book_ids = [367, 2982, 21]
  path = File.join(HiMyMac.logs_path, '.books')
  FileUtils.mkdir_p path
  BooksUpdater.new(path, book_ids).update
end
