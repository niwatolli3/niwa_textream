require 'niwa_textream/pages/main/main_page.rb'

module NiwaTextream
  # Textream's top page (http://textream.yahoo.co.jp/)
  class TopPage < MainPage
    attr_accessor :categories
    @@url = "http://textream.yahoo.co.jp/"
    @categories = nil

    def self.url
      @@url
    end

    def initialize(mechanize)
      super(mechanize)
      @page = @mechanize.get(@@url)
      set_categories
    end

    # search categories mechanize objects
    def set_categories
      @categories = {}
      @mechanize.page.search('//*[@id="prtcalst"]//li').each do |cat|
        cat_link = cat.search('a')[0]
        cat_name = cat.search('.//em')[0].inner_text()
        catObj = Category.new()
        catObj.elem = cat_link
        catObj.name = cat_name
        @categories[cat_name] = catObj

        puts("#{cat_name}")
        puts("-------------------")
      end
    end
  end
end