require 'niwa_textream/pages/main/main_page'
require 'niwa_textream/pages/message/message_header'
require 'niwa_textream/models/message'

module NiwaTextream
  class MessageHeader < MainPage
    # @@url = "http://textream.yahoo.co.jp/category/%{category_id}"
    attr_accessor :bar, :prevBtn, :nextBtn
    @bar = nil
    @prevBtn = nil
    @nextBtn = nil

    def initialize(mechanize)
      super(mechanize)
      setTopBg
      return self
    end

    def setTopBg
      @messages = []
      @bar = @mechanize.page.search("//div[@id='toppg']")
      @prevBtn = @bar.search(".//li[@class='prev']/a")[0]
      @nextBtn = @bar.search(".//li[@class='next']/a")[0]
    end

    def prevPageAvail?
      return @prevBtn.nil? == false
    end

    def nextPageAvail?
      return @nextBtn.nil? == false
    end

    def clickPrevButton
      @mechanize.click(@prevBtn)
      return MessagePage.new(@mechanize)
    end

    def clickNextButton
      @mechanize.click(@nextBtn)
      return MessagePage.new(@mechanize)
    end
  end
end

