require 'niwa_textream/pages/main/main_page.rb'

module NiwaTextream
  class CategoryPage < MainPage
    @@url = "http://textream.yahoo.co.jp/category/%{category_id}"
    @categories = nil
    attr_accessor :categories

    def initialize(mechanize)
      super(mechanize)
      setCategory
      return self
    end

    # set category(its parent category is not set)
    def setCategory
      @categories = {}
      @mechanize.page.search("//a[@class='cf']").each do |cat|
        num_thread_with_bracket = cat.search('.//span')[0].inner_text
        num_thread = num_thread_with_bracket.match('\((\d+)\)')[1]
        catObj = NiwaTextream::Category.new
        catObj.elem = cat
        catObj.name = cat.inner_text.match('(.+?)\((.+?)\)')[1]
        catObj.num_thread = num_thread
        @categories[catObj.name] = catObj
        puts("--#CategoryPage#--")
        puts(catObj.name)
      end
    end
  end
end
