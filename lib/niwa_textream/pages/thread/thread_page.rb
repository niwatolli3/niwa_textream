require 'niwa_textream/pages/main/main_page.rb'
require 'niwa_textream/models/thread'

module NiwaTextream
  # thread list
  class ThreadPage < MainPage
    @@url = "http://textream.yahoo.co.jp/thread/%{category_id}"
    @threads = nil
    attr_accessor :threads

    def initialize(mechanize)
      super(mechanize)
      setThreads
      return self
    end

    def setThreads
      @threads = []
      @mechanize.page.search("//*[@id='trdlst']//dl[@class='cf']").each do |thread|
        thread_title_elem = thread.search(".//a[@data-sec='trdlst']")[0]
        last_updated = DateTime.parse(thread.search(".//li[@class='time bold']")[0].inner_text())
        num_comment = thread.search("//*[@class='commentCount']").inner_text().to_i
        @threads.push(NiwaTextream::Thread.new(thread_title_elem, thread_title_elem.inner_text(), num_comment, last_updated))
        puts("#{thread_title_elem.inner_text()}, #{num_comment}, #{last_updated}")
      end
    end
  end
end
