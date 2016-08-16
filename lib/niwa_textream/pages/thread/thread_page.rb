require 'niwa_textream/pages/main/main_page.rb'
require 'niwa_textream/models/thread'

module NiwaTextream
  # thread list
  class ThreadPage < MainPage
    @@url = "http://textream.yahoo.co.jp/thread/%{category_id}"
    @threads = nil
    @next_page_elem
    @prev_page_elem
    attr_accessor :threads, :prev_page_elem, :next_page_elem

    def initialize(mechanize)
      super(mechanize)
      setThreads
      setNextPageElem
      setPrevPageElem
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

    def setNextPageElem
      @next_page_elem = @mechanize.page.search("//*[@class='btnNext']/a")[0]
    end

    def setPrevPageElem
      @prev_page_elem = @mechanize.page.search("//*[@class='btnPrev']/a")[0]
    end

    def clickNextPage
      @mechanize.click(@next_page_elem)
      return NiwaTextream::ThreadPage.new(@mechanize)
    end

    def clickPrevPage
      @mechanize.click(@prev_page_elem)
      return NiwaTextream::ThreadPage.new(@mechanize)
    end
  end
end
