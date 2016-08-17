require 'niwa_textream/pages/main/main_page.rb'
require 'niwa_textream/pages/thread/thread_page'
require 'niwa_textream/utils/TimeUtil'
require 'niwa_textream/models/message'
require 'niwa_textream/pages/message/message_header'

module NiwaTextream
  class MessagePage < MainPage
    # @@url = "http://textream.yahoo.co.jp/category/%{category_id}"
    @messages = nil
    @message_header = nil
    attr_accessor :messages, :message_header

    def initialize(mechanize)
      super(mechanize)
      @message_header = MessageHeader.new(mechanize)
      setMessages
      return self
    end

    def setMessages
      @messages = []
      @mechanize.page.search("//ul[@class='commentList']//div[@class='comment']").each do |message|
        message_id = message['data-comment']
        body = message.search(".//p[@class='comText']")[0].inner_text()
        posted_at_str = message.search(".//p[@class='comWriter']/span/a").inner_text()
        posted_at = NiwaTextream::TimeUtil.getDateTime(posted_at_str)
        messageObj = NiwaTextream::Message.new(message, body, posted_at)
        @messages.push(messageObj)
        puts("#{body}, #{posted_at}")
      end
    end
  end
end
