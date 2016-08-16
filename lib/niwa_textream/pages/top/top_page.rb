require 'niwa_textream/pages/main/main_page.rb'
require 'niwa_textream/pages/category/category_page.rb'

module NiwaTextream
  # Textream's top page (http://textream.yahoo.co.jp/)
  class TopPage < MainPage
    attr_accessor :categories
    @@url = "http://textream.yahoo.co.jp/"
    @categories = nil

    def initialize(mechanize)
      super(mechanize)
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

    # click category.
    # * +name+ - category name(string)
    # return: CategoryPage (If you click this link, you will move to CategoryPage)
    def clickCategory(name)
      @mechanize.click(@categories[name].elem)
      return NiwaTextream::CategoryPage.new(@mechanize)
    end
  end
end